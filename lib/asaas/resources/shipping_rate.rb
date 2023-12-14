# frozen_string_literal: true

module Asaas
  # Shipping rates describe the price of shipping presented to your customers and
  # applied to a purchase. For more information, see [Charge for shipping](https://asaas.com/docs/payments/during-payment/charge-shipping).
  class ShippingRate < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "shipping_rate"
  end
end
