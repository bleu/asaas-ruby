# frozen_string_literal: true

module Asaas
  # A `Transfer` object is created when you move funds between Asaas accounts as
  # part of Connect.
  #
  # Before April 6, 2017, transfers also represented movement of funds from a
  # Asaas account to a card or bank account. This behavior has since been split
  # out into a [Payout](https://asaas.com/docs/api#payout_object) object, with corresponding payout endpoints. For more
  # information, read about the
  # [transfer/payout split](https://asaas.com/docs/transfer-payout-split).
  #
  # Related guide: [Creating separate charges and transfers](https://asaas.com/docs/connect/separate-charges-and-transfers)
  class Transfer < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save
    extend Asaas::APIOperations::NestedResource

    OBJECT_NAME = "transfer"

    nested_resource_class_methods :reversal, operations: %i[create retrieve update list]
  end
end
