# frozen_string_literal: true

module Asaas
  # A Promotion Code represents a customer-redeemable code for a [coupon](https://asaas.com/docs/api#coupons). It can be used to
  # create multiple codes for a single coupon.
  class PromotionCode < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "promotion_code"
  end
end
