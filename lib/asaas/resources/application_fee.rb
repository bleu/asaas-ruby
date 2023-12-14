# frozen_string_literal: true

module Asaas
  class ApplicationFee < APIResource
    extend Asaas::APIOperations::List
    extend Asaas::APIOperations::NestedResource

    OBJECT_NAME = "application_fee"

    nested_resource_class_methods :refund, operations: %i[create retrieve update list]
  end
end
