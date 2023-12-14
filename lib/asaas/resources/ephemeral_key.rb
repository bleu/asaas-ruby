# frozen_string_literal: true

module Asaas
  class EphemeralKey < APIResource
    extend Asaas::APIOperations::Create
    include Asaas::APIOperations::Delete

    OBJECT_NAME = "ephemeral_key"

    def self.create(params = {}, opts = {})
      opts = Util.normalize_opts(opts)
      unless opts[:asaas_version]
        raise ArgumentError,
              "asaas_version must be specified to create an ephemeral key"
      end
      super
    end
  end
end
