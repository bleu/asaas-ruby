# frozen_string_literal: true

module Asaas
  # The `Charge` object represents a single attempt to move money into your Asaas account.
  # PaymentIntent confirmation is the most common way to create Charges, but transferring
  # money to a different Asaas account through Connect also creates Charges.
  # Some legacy payment flows create Charges directly, which is not recommended for new integrations.
  class Charge < APIResource
    extend Asaas::APIOperations::Create
    extend Asaas::APIOperations::List
    extend Asaas::APIOperations::Search
    include Asaas::APIOperations::Save

    OBJECT_NAME = "payment"

    def capture(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/charges/%<charge>s/capture", { charge: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def self.capture(charge, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/charges/%<charge>s/capture", { charge: CGI.escape(charge) }),
        params: params,
        opts: opts
      )
    end

    def self.search(params = {}, opts = {})
      _search("/v1/charges/search", params, opts)
    end

    def self.search_auto_paging_each(params = {}, opts = {}, &blk)
      search(params, opts).auto_paging_each(&blk)
    end
  end
end
