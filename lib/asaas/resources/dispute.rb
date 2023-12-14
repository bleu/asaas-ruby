# frozen_string_literal: true

module Asaas
  # A dispute occurs when a customer questions your charge with their card issuer.
  # When this happens, you have the opportunity to respond to the dispute with
  # evidence that shows that the charge is legitimate.
  #
  # Related guide: [Disputes and fraud](https://asaas.com/docs/disputes)
  class Dispute < APIResource
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "dispute"

    def close(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/disputes/%<dispute>s/close", { dispute: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def self.close(dispute, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/disputes/%<dispute>s/close", { dispute: CGI.escape(dispute) }),
        params: params,
        opts: opts
      )
    end
  end
end
