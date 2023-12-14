# frozen_string_literal: true

module Asaas
  # This object represents a customer of your business. Use it to create recurring charges and track payments that belong to the same customer.
  #
  # Related guide: [Save a card during payment](https://asaas.com/docs/payments/save-during-payment)
  class Customer < APIResource
    extend Asaas::APIOperations::Create
    include Asaas::APIOperations::Delete
    extend Asaas::APIOperations::List
    extend Asaas::APIOperations::Search
    include Asaas::APIOperations::Save
    extend Asaas::APIOperations::NestedResource

    OBJECT_NAME = "customer"

    nested_resource_class_methods :balance_transaction, operations: %i[create retrieve update list]
    nested_resource_class_methods :cash_balance_transaction, operations: %i[retrieve list]
    nested_resource_class_methods :tax_id, operations: %i[create retrieve delete list]

    def create_funding_instructions(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v3/customers/%<customer>s/funding_instructions", { customer: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def delete_discount(params = {}, opts = {})
      request_asaas_object(
        method: :delete,
        path: format("/v3/customers/%<customer>s/discount", { customer: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def list_payment_methods(params = {}, opts = {})
      request_asaas_object(
        method: :get,
        path: format("/v3/customers/%<customer>s/payment_methods", { customer: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def retrieve_payment_method(payment_method, params = {}, opts = {})
      request_asaas_object(
        method: :get,
        path: format("/v3/customers/%<customer>s/payment_methods/%<payment_method>s", { customer: CGI.escape(self["id"]), payment_method: CGI.escape(payment_method) }),
        params: params,
        opts: opts
      )
    end

    def self.create_funding_instructions(customer, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v3/customers/%<customer>s/funding_instructions", { customer: CGI.escape(customer) }),
        params: params,
        opts: opts
      )
    end

    def self.delete_discount(customer, params = {}, opts = {})
      request_asaas_object(
        method: :delete,
        path: format("/v3/customers/%<customer>s/discount", { customer: CGI.escape(customer) }),
        params: params,
        opts: opts
      )
    end

    def self.list_payment_methods(customer, params = {}, opts = {})
      request_asaas_object(
        method: :get,
        path: format("/v3/customers/%<customer>s/payment_methods", { customer: CGI.escape(customer) }),
        params: params,
        opts: opts
      )
    end

    def self.retrieve_payment_method(customer, payment_method, params = {}, opts = {})
      request_asaas_object(
        method: :get,
        path: format("/v3/customers/%<customer>s/payment_methods/%<payment_method>s", { customer: CGI.escape(customer), payment_method: CGI.escape(payment_method) }),
        params: params,
        opts: opts
      )
    end

    save_nested_resource :source
    nested_resource_class_methods :source,
                                  operations: %i[create retrieve update delete list]

    # The API request for deleting a card or bank account and for detaching a
    # source object are the same.
    class << self
      alias detach_source delete_source
    end

    def self.search(params = {}, opts = {})
      _search("/v3/customers/search", params, opts)
    end

    def self.search_auto_paging_each(params = {}, opts = {}, &blk)
      search(params, opts).auto_paging_each(&blk)
    end

    def self.retrieve_cash_balance(customer, params = {}, opts = {})
      request_asaas_object(
        method: :get,
        path: format("/v3/customers/%<customer>s/cash_balance", { customer: CGI.escape(customer) }),
        params: params,
        opts: opts
      )
    end

    def self.update_cash_balance(customer, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v3/customers/%<customer>s/cash_balance", { customer: CGI.escape(customer) }),
        params: params,
        opts: opts
      )
    end
  end
end
