# frozen_string_literal: true

module Asaas
  # You can add one or multiple tax IDs to a [customer](https://asaas.com/docs/api/customers) or account.
  # Customer and account tax IDs get displayed on related invoices and credit notes.
  #
  # Related guides: [Customer tax identification numbers](https://asaas.com/docs/billing/taxes/tax-ids), [Account tax IDs](https://asaas.com/docs/invoicing/connect#account-tax-ids)
  class TaxId < APIResource
    include Asaas::APIOperations::Delete
    extend Asaas::APIOperations::List

    OBJECT_NAME = "tax_id"

    def resource_url
      if !respond_to?(:customer) || customer.nil?
        raise NotImplementedError,
              "Tax IDs cannot be accessed without a customer ID."
      end
      "#{Customer.resource_url}/#{CGI.escape(customer)}/tax_ids" \
        "/#{CGI.escape(id)}"
    end

    def self.retrieve(_id, _opts = {})
      raise NotImplementedError,
            "Tax IDs cannot be retrieved without a customer ID. Retrieve a " \
            "tax ID using `Customer.retrieve_tax_id('customer_id', " \
            "'tax_id_id')`"
    end
  end
end
