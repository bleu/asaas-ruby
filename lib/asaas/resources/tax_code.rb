# frozen_string_literal: true

module Asaas
  # [Tax codes](https://asaas.com/docs/tax/tax-categories) classify goods and services for tax purposes.
  class TaxCode < APIResource
    extend Asaas::APIOperations::List

    OBJECT_NAME = "tax_code"
  end
end
