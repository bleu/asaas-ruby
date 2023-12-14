# frozen_string_literal: true

module Asaas
  # You can configure [webhook endpoints](https://asaas.com/docs/webhooks/) via the API to be
  # notified about events that happen in your Asaas account or connected
  # accounts.
  #
  # Most users configure webhooks from [the dashboard](https://dashboard.asaas.com/webhooks), which provides a user interface for registering and testing your webhook endpoints.
  #
  # Related guide: [Setting up webhooks](https://asaas.com/docs/webhooks/configure)
  class WebhookEndpoint < APIResource
    extend Asaas::APIOperations::Create
    include Asaas::APIOperations::Delete
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "webhook_endpoint"
  end
end
