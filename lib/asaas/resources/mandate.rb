# frozen_string_literal: true

module Asaas
  # A Mandate is a record of the permission that your customer gives you to debit their payment method.
  class Mandate < APIResource
    OBJECT_NAME = "mandate"
  end
end
