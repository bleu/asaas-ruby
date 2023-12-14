# frozen_string_literal: true

module Asaas
  # PaymentMethodConfigurations control which payment methods are displayed to your customers when you don't explicitly specify payment method types. You can have multiple configurations with different sets of payment methods for different scenarios.
  #
  # There are two types of PaymentMethodConfigurations. Which is used depends on the [charge type](https://asaas.com/docs/connect/charges):
  #
  # **Direct** configurations apply to payments created on your account, including Connect destination charges, Connect separate charges and transfers, and payments not involving Connect.
  #
  # **Child** configurations apply to payments created on your connected accounts using direct charges, and charges with the on_behalf_of parameter.
  #
  # Child configurations have a `parent` that sets default values and controls which settings connected accounts may override. You can specify a parent ID at payment time, and Asaas will automatically resolve the connected account's associated child configuration. Parent configurations are [managed in the dashboard](https://dashboard.asaas.com/settings/payment_methods/connected_accounts) and are not available in this API.
  #
  # Related guides:
  # - [Payment Method Configurations API](https://asaas.com/docs/connect/payment-method-configurations)
  # - [Multiple configurations on dynamic payment methods](https://asaas.com/docs/payments/multiple-payment-method-configs)
  # - [Multiple configurations for your Connect accounts](https://asaas.com/docs/connect/multiple-payment-method-configurations)
  class PaymentMethodConfiguration < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "payment_method_configuration"
  end
end
