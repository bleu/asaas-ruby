# frozen_string_literal: true

module Asaas
  # A payment link is a shareable URL that will take your customers to a hosted payment page. A payment link can be shared and used multiple times.
  #
  # When a customer opens a payment link it will open a new [checkout session](https://asaas.com/docs/api/checkout/sessions) to render the payment page. You can use [checkout session events](https://asaas.com/docs/api/events/types#event_types-checkout.session.completed) to track payments through payment links.
  #
  # Related guide: [Payment Links API](https://asaas.com/docs/payment-links)
  class PaymentLink < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "payment_link"

    def list_line_items(params = {}, opts = {})
      request_asaas_object(
        method: :get,
        path: format("/v1/payment_links/%<payment_link>s/line_items", { payment_link: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def self.list_line_items(payment_link, params = {}, opts = {})
      request_asaas_object(
        method: :get,
        path: format("/v1/payment_links/%<payment_link>s/line_items", { payment_link: CGI.escape(payment_link) }),
        params: params,
        opts: opts
      )
    end
  end
end
