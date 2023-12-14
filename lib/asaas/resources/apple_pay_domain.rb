# frozen_string_literal: true

module Asaas
  # Domains registered for Apple Pay on the Web
  class ApplePayDomain < APIResource
    extend Asaas::APIOperations::Create
    include Asaas::APIOperations::Delete
    extend Asaas::APIOperations::List

    OBJECT_NAME = "apple_pay_domain"

    def self.resource_url
      "/v1/apple_pay/domains"
    end
  end
end
