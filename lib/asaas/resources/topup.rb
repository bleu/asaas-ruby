# frozen_string_literal: true

module Asaas
  # To top up your Asaas balance, you create a top-up object. You can retrieve
  # individual top-ups, as well as list all top-ups. Top-ups are identified by a
  # unique, random ID.
  #
  # Related guide: [Topping up your platform account](https://asaas.com/docs/connect/top-ups)
  class Topup < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "topup"

    def cancel(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/topups/%<topup>s/cancel", { topup: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def self.cancel(topup, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/topups/%<topup>s/cancel", { topup: CGI.escape(topup) }),
        params: params,
        opts: opts
      )
    end
  end
end
