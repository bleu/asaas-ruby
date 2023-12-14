# frozen_string_literal: true

# Asaas Ruby bindings
# API spec at https://asaas.com/docs/api
require "cgi"
require "json"
require "logger"
require "net/http"
require "openssl"
require "rbconfig"
require "securerandom"
require "set"
require "socket"
require "uri"
require "forwardable"

# Version
require "asaas/api_version"
require "asaas/version"

# API operations
require "asaas/api_operations/create"
require "asaas/api_operations/delete"
require "asaas/api_operations/list"
require "asaas/api_operations/nested_resource"
require "asaas/api_operations/request"
require "asaas/api_operations/save"
require "asaas/api_operations/search"

# API resource support classes
require "asaas/errors"
require "asaas/object_types"
require "asaas/util"
require "asaas/connection_manager"
require "asaas/multipart_encoder"
require "asaas/asaas_client"
require "asaas/asaas_object"
require "asaas/asaas_response"
require "asaas/list_object"
require "asaas/search_result_object"
require "asaas/error_object"
require "asaas/api_resource"
require "asaas/singleton_api_resource"
require "asaas/webhook"
require "asaas/asaas_configuration"

# Named API resources
require "asaas/resources"

module Asaas
  # map to the same values as the standard library's logger
  LEVEL_DEBUG = Logger::DEBUG
  LEVEL_ERROR = Logger::ERROR
  LEVEL_INFO = Logger::INFO

  @app_info = nil

  @config = Asaas::AsaasConfiguration.setup

  class << self
    extend Forwardable

    attr_reader :config

    # User configurable options
    def_delegators :@config, :api_key, :api_key=
    def_delegators :@config, :api_version, :api_version=
    def_delegators :@config, :asaas_account, :asaas_account=
    def_delegators :@config, :api_base, :api_base=
    def_delegators :@config, :connect_base, :connect_base=
    def_delegators :@config, :open_timeout, :open_timeout=
    def_delegators :@config, :read_timeout, :read_timeout=
    def_delegators :@config, :write_timeout, :write_timeout=
    def_delegators :@config, :proxy, :proxy=
    def_delegators :@config, :log_level, :log_level=
    def_delegators :@config, :logger, :logger=
    def_delegators :@config, :max_network_retries, :max_network_retries=
    def_delegators :@config, :enable_telemetry=, :enable_telemetry?
    def_delegators :@config, :client_id=, :client_id

    # Internal configurations
    def_delegators :@config, :max_network_retry_delay
    def_delegators :@config, :initial_network_retry_delay
  end

  # Gets the application for a plugin that's identified some. See
  # #set_app_info.
  def self.app_info
    @app_info
  end

  def self.app_info=(info)
    @app_info = info
  end

  # Sets some basic information about the running application that's sent along
  # with API requests. Useful for plugin authors to identify their plugin when
  # communicating with Asaas.
  #
  # Takes a name and optional partner program ID, plugin URL, and version.
  def self.set_app_info(name, partner_id: nil, url: nil, version: nil)
    @app_info = {
      name: name,
      partner_id: partner_id,
      url: url,
      version: version,
    }
  end
end

Asaas.log_level = ENV["ASAAS_LOG"] unless ENV["ASAAS_LOG"].nil?
