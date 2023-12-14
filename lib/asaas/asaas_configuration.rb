# frozen_string_literal: true

module Asaas
  # Configurable options:
  #
  # =log_level=
  # When set prompts the library to log some extra information to $stdout and
  # $stderr about what it's doing. For example, it'll produce information about
  # requests, responses, and errors that are received. Valid log levels are
  # `debug` and `info`, with `debug` being a little more verbose in places.
  #
  # Use of this configuration is only useful when `.logger` is _not_ set. When
  # it is, the decision what levels to print is entirely deferred to the logger.
  #
  # =logger=
  # The logger should support the same interface as the `Logger` class that's
  # part of Ruby's standard library (hint, anything in `Rails.logger` will
  # likely be suitable).
  #
  # If `.logger` is set, the value of `.log_level` is ignored. The decision on
  # what levels to print is entirely deferred to the logger.
  class AsaasConfiguration
    attr_accessor :api_key, :api_version, :client_id, :enable_telemetry, :logger, :asaas_account

    attr_reader :api_base, :connect_base, :log_level, :initial_network_retry_delay,
                :max_network_retries, :max_network_retry_delay, :open_timeout, :read_timeout, :write_timeout, :proxy

    def self.setup
      new.tap do |instance|
        yield(instance) if block_given?
      end
    end

    # Create a new config based off an existing one. This is useful when the
    # caller wants to override the global configuration
    def reverse_duplicate_merge(hash)
      dup.tap do |instance|
        hash.each do |option, value|
          instance.public_send("#{option}=", value)
        end
      end
    end

    def initialize
      @api_version = ApiVersion::CURRENT
      @enable_telemetry = true

      @max_network_retries = 0
      @initial_network_retry_delay = 0.5
      @max_network_retry_delay = 2

      @open_timeout = 30
      @read_timeout = 80
      @write_timeout = 30

      # @api_base = "https://api.asaas.com"
      @api_base = "https://sandbox.asaas.com/api/"
    end

    def log_level=(val)
      # Backwards compatibility for values that we briefly allowed
      if val == "debug"
        val = Asaas::LEVEL_DEBUG
      elsif val == "info"
        val = Asaas::LEVEL_INFO
      elsif val == "error"
        val = Asaas::LEVEL_ERROR
      end

      levels = [Asaas::LEVEL_INFO, Asaas::LEVEL_DEBUG, Asaas::LEVEL_ERROR]

      if !val.nil? && !levels.include?(val)
        raise ArgumentError,
              "log_level should only be set to `nil`, `debug`, `info`, " \
              "or `error`"
      end
      @log_level = val
    end

    def max_network_retries=(val)
      @max_network_retries = val.to_i
    end

    def max_network_retry_delay=(val)
      @max_network_retry_delay = val.to_i
    end

    def initial_network_retry_delay=(val)
      @initial_network_retry_delay = val.to_i
    end

    def open_timeout=(open_timeout)
      @open_timeout = open_timeout
      AsaasClient.clear_all_connection_managers(config: self)
    end

    def read_timeout=(read_timeout)
      @read_timeout = read_timeout
      AsaasClient.clear_all_connection_managers(config: self)
    end

    def write_timeout=(write_timeout)
      raise NotImplementedError unless Net::HTTP.instance_methods.include?(:write_timeout=)

      @write_timeout = write_timeout
      AsaasClient.clear_all_connection_managers(config: self)
    end

    def proxy=(proxy)
      @proxy = proxy
      AsaasClient.clear_all_connection_managers(config: self)
    end

    def connect_base=(connect_base)
      @connect_base = connect_base
      AsaasClient.clear_all_connection_managers(config: self)
    end

    def api_base=(api_base)
      @api_base = api_base
      AsaasClient.clear_all_connection_managers(config: self)
    end

    def enable_telemetry?
      enable_telemetry
    end

    # Generates a deterministic key to identify configuration objects with
    # identical configuration values.
    def key
      instance_variables
        .collect { |variable| instance_variable_get(variable) }
        .join
    end
  end
end
