# frozen_string_literal: true

module Asaas
  # Installments allow you to charge a customer with a fixed number of payments.
  #
  # Related guide: [Creating installments](https://docs.asaas.com/reference/criar-nova-cobranca-parcelada)
  class Installment < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::Delete
    extend Asaas::APIOperations::List
    extend Asaas::APIOperations::Search
    include Asaas::APIOperations::Save

    OBJECT_NAME = "installment"

    def self.resource_url
      "/v3/installments"
    end

    def resource_url
      "/v3/installments/#{CGI.escape(id)}"
    end

    # Retrieve installment payments
    def self.payments(installment, params = {}, opts = {})
      request_asaas_object(
        method: :get,
        path: format("/v3/installments/%<installment>s/payments", { installment: CGI.escape(installment) }),
        params: params,
        opts: opts
      )
    end
  end
end
