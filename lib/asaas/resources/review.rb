# frozen_string_literal: true

module Asaas
  # Reviews can be used to supplement automated fraud detection with human expertise.
  #
  # Learn more about [Radar](https://asaas.com/radar) and reviewing payments
  # [here](https://asaas.com/docs/radar/reviews).
  class Review < APIResource
    extend Asaas::APIOperations::List

    OBJECT_NAME = "review"

    def approve(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/reviews/%<review>s/approve", { review: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def self.approve(review, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/reviews/%<review>s/approve", { review: CGI.escape(review) }),
        params: params,
        opts: opts
      )
    end
  end
end
