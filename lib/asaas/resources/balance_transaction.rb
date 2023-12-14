# frozen_string_literal: true

module Asaas
  # Balance transactions represent funds moving through your Asaas account.
  # Asaas creates them for every type of transaction that enters or leaves your Asaas account balance.
  #
  # Related guide: [Balance transaction types](https://asaas.com/docs/reports/balance-transaction-types)
  class BalanceTransaction < APIResource
    extend Asaas::APIOperations::List

    OBJECT_NAME = "balance_transaction"
  end
end
