# frozen_string_literal: true

module Asaas
  # Usage records allow you to report customer usage and metrics to Asaas for
  # metered billing of subscription prices.
  #
  # Related guide: [Metered billing](https://asaas.com/docs/billing/subscriptions/metered-billing)
  class UsageRecord < APIResource
    OBJECT_NAME = "usage_record"
  end
end
