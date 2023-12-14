# frozen_string_literal: true

module Asaas
  # Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products.
  # [Products](https://asaas.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.
  #
  # For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.
  #
  # Related guides: [Set up a subscription](https://asaas.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://asaas.com/docs/billing/invoices/create), and more about [products and prices](https://asaas.com/docs/products-prices/overview).
  class Price < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    extend Asaas::APIOperations::Search
    include Asaas::APIOperations::Save

    OBJECT_NAME = "price"

    def self.search(params = {}, opts = {})
      _search("/v1/prices/search", params, opts)
    end

    def self.search_auto_paging_each(params = {}, opts = {}, &blk)
      search(params, opts).auto_paging_each(&blk)
    end
  end
end
