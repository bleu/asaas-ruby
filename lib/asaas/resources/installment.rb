# frozen_string_literal: true

module Asaas
  # TODO: doc.
  class Installment < APIResource
    extend Asaas::APIOperations::Search
    include Asaas::APIOperations::Save
    extend Asaas::APIOperations::List

    OBJECT_NAME = "installment"

    def self.resource_url
      "/v3/installments"
    end

    def resource_url
      "/v3/installments/#{CGI.escape(id)}"
    end

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
