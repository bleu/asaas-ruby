# frozen_string_literal: true

module Asaas
  # A discount represents the actual application of a [coupon](https://asaas.com/docs/api#coupons) or [promotion code](https://asaas.com/docs/api#promotion_codes).
  # It contains information about when the discount began, when it will end, and what it is applied to.
  #
  # Related guide: [Applying discounts to subscriptions](https://asaas.com/docs/billing/subscriptions/discounts)
  class Discount < AsaasObject
    OBJECT_NAME = "discount"
  end
end
