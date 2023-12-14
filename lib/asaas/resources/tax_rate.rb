# frozen_string_literal: true

module Asaas
  # Tax rates can be applied to [invoices](https://asaas.com/docs/billing/invoices/tax-rates), [subscriptions](https://asaas.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://asaas.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.
  #
  # Related guide: [Tax rates](https://asaas.com/docs/billing/taxes/tax-rates)
  class TaxRate < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "tax_rate"
  end
end
