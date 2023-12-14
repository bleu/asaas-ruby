# frozen_string_literal: true

module Asaas
  # A coupon contains information about a percent-off or amount-off discount you
  # might want to apply to a customer. Coupons may be applied to [subscriptions](https://asaas.com/docs/api#subscriptions), [invoices](https://asaas.com/docs/api#invoices),
  # [checkout sessions](https://asaas.com/docs/api/checkout/sessions), [quotes](https://asaas.com/docs/api#quotes), and more. Coupons do not work with conventional one-off [charges](https://asaas.com/docs/api#create_charge) or [payment intents](https://asaas.com/docs/api/payment_intents).
  class Coupon < APIResource
    extend Asaas::APIOperations::Create
    include Asaas::APIOperations::Delete
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "coupon"
  end
end
