# frozen_string_literal: true

module Asaas
  # This is an object representing your Asaas balance. You can retrieve it to see
  # the balance currently on your Asaas account.
  #
  # You can also retrieve the balance history, which contains a list of
  # [transactions](https://asaas.com/docs/reporting/balance-transaction-types) that contributed to the balance
  # (charges, payouts, and so forth).
  #
  # The available and pending amounts for each currency are broken down further by
  # payment source types.
  #
  # Related guide: [Understanding Connect account balances](https://asaas.com/docs/connect/account-balances)
  class Balance < SingletonAPIResource
    OBJECT_NAME = "balance"
  end
end
