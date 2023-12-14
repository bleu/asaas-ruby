# frozen_string_literal: true

module Asaas
  # A SetupAttempt describes one attempted confirmation of a SetupIntent,
  # whether that confirmation is successful or unsuccessful. You can use
  # SetupAttempts to inspect details of a specific attempt at setting up a
  # payment method using a SetupIntent.
  class SetupAttempt < APIResource
    extend Asaas::APIOperations::List

    OBJECT_NAME = "setup_attempt"
  end
end
