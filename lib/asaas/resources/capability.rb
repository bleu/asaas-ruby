# frozen_string_literal: true

module Asaas
  # This is an object representing a capability for a Asaas account.
  #
  # Related guide: [Account capabilities](https://asaas.com/docs/connect/account-capabilities)
  class Capability < APIResource
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "capability"

    def resource_url
      if !respond_to?(:account) || account.nil?
        raise NotImplementedError,
              "Capabilities cannot be accessed without an account ID."
      end
      "#{Account.resource_url}/#{CGI.escape(account)}/capabilities" \
        "/#{CGI.escape(id)}"
    end

    def self.retrieve(_id, _opts = {})
      raise NotImplementedError,
            "Capabilities cannot be retrieve without an account ID. " \
            "Retrieve a capability using Account.retrieve_capability(" \
            "'account_id', 'capability_id')`"
    end

    def self.update(_id, _params = nil, _opts = nil)
      raise NotImplementedError,
            "Capabilities cannot be updated without an account ID. Update a " \
            "capability using `Account.update_capability('account_id', " \
            "'capability_id', update_params)`"
    end
  end
end
