# frozen_string_literal: true

module Asaas
  # Account Links are the means by which a Connect platform grants a connected account permission to access
  # Asaas-hosted applications, such as Connect Onboarding.
  #
  # Related guide: [Connect Onboarding](https://asaas.com/docs/connect/custom/hosted-onboarding)
  class AccountLink < APIResource
    extend Asaas::APIOperations::Create

    OBJECT_NAME = "account_link"
  end
end
