# frozen_string_literal: true

module Asaas
  # Products describe the specific goods or services you offer to your customers.
  # For example, you might offer a Standard and Premium version of your goods or service; each version would be a separate Product.
  # They can be used in conjunction with [Prices](https://asaas.com/docs/api#prices) to configure pricing in Payment Links, Checkout, and Subscriptions.
  #
  # Related guides: [Set up a subscription](https://asaas.com/docs/billing/subscriptions/set-up-subscription),
  # [share a Payment Link](https://asaas.com/docs/payment-links),
  # [accept payments with Checkout](https://asaas.com/docs/payments/accept-a-payment#create-product-prices-upfront),
  # and more about [Products and Prices](https://asaas.com/docs/products-prices/overview)
  class Product < APIResource
    extend Asaas::APIOperations::Create
    include Asaas::APIOperations::Delete
    extend Asaas::APIOperations::List
    extend Asaas::APIOperations::Search
    include Asaas::APIOperations::Save

    OBJECT_NAME = "product"

    def self.search(params = {}, opts = {})
      _search("/v1/products/search", params, opts)
    end

    def self.search_auto_paging_each(params = {}, opts = {}, &blk)
      search(params, opts).auto_paging_each(&blk)
    end
  end
end
