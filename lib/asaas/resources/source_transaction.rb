# frozen_string_literal: true

module Asaas
  # Some payment methods have no required amount that a customer must send.
  # Customers can be instructed to send any amount, and it can be made up of
  # multiple transactions. As such, sources can have multiple associated
  # transactions.
  class SourceTransaction < AsaasObject
    OBJECT_NAME = "source_transaction"
  end
end
