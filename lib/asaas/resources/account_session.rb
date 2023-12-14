# frozen_string_literal: true

module Asaas
  # An AccountSession allows a Connect platform to grant access to a connected account in Connect embedded components.
  #
  # We recommend that you create an AccountSession each time you need to display an embedded component
  # to your user. Do not save AccountSessions to your database as they expire relatively
  # quickly, and cannot be used more than once.
  #
  # Related guide: [Connect embedded components](https://asaas.com/docs/connect/get-started-connect-embedded-components)
  class AccountSession < APIResource
    extend Asaas::APIOperations::Create

    OBJECT_NAME = "account_session"
  end
end
