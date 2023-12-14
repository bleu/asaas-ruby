# frozen_string_literal: true

module Asaas
  # Invoices are statements of amounts owed by a customer, and are either
  # generated one-off, or generated periodically from a subscription.
  #
  # They contain [invoice items](https://asaas.com/docs/api#invoiceitems), and proration adjustments
  # that may be caused by subscription upgrades/downgrades (if necessary).
  #
  # If your invoice is configured to be billed through automatic charges,
  # Asaas automatically finalizes your invoice and attempts payment. Note
  # that finalizing the invoice,
  # [when automatic](https://asaas.com/docs/invoicing/integration/automatic-advancement-collection), does
  # not happen immediately as the invoice is created. Asaas waits
  # until one hour after the last webhook was successfully sent (or the last
  # webhook timed out after failing). If you (and the platforms you may have
  # connected to) have no webhooks configured, Asaas waits one hour after
  # creation to finalize the invoice.
  #
  # If your invoice is configured to be billed by sending an email, then based on your
  # [email settings](https://dashboard.asaas.com/account/billing/automatic),
  # Asaas will email the invoice to your customer and await payment. These
  # emails can contain a link to a hosted page to pay the invoice.
  #
  # Asaas applies any customer credit on the account before determining the
  # amount due for the invoice (i.e., the amount that will be actually
  # charged). If the amount due for the invoice is less than Asaas's [minimum allowed charge
  # per currency](https://asaas.com/docs/currencies#minimum-and-maximum-charge-amounts), the
  # invoice is automatically marked paid, and we add the amount due to the
  # customer's credit balance which is applied to the next invoice.
  #
  # More details on the customer's credit balance are
  # [here](https://asaas.com/docs/billing/customer/balance).
  #
  # Related guide: [Send invoices to customers](https://asaas.com/docs/billing/invoices/sending)
  class Invoice < APIResource
    extend Asaas::APIOperations::Create
    include Asaas::APIOperations::Delete
    extend Asaas::APIOperations::List
    extend Asaas::APIOperations::Search
    include Asaas::APIOperations::Save

    OBJECT_NAME = "invoice"

    def finalize_invoice(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/finalize", { invoice: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def mark_uncollectible(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/mark_uncollectible", { invoice: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def pay(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/pay", { invoice: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def send_invoice(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/send", { invoice: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def void_invoice(params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/void", { invoice: CGI.escape(self["id"]) }),
        params: params,
        opts: opts
      )
    end

    def self.finalize_invoice(invoice, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/finalize", { invoice: CGI.escape(invoice) }),
        params: params,
        opts: opts
      )
    end

    def self.list_upcoming_line_items(params = {}, opts = {})
      request_asaas_object(
        method: :get,
        path: "/v1/invoices/upcoming/lines",
        params: params,
        opts: opts
      )
    end

    def self.mark_uncollectible(invoice, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/mark_uncollectible", { invoice: CGI.escape(invoice) }),
        params: params,
        opts: opts
      )
    end

    def self.pay(invoice, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/pay", { invoice: CGI.escape(invoice) }),
        params: params,
        opts: opts
      )
    end

    def self.send_invoice(invoice, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/send", { invoice: CGI.escape(invoice) }),
        params: params,
        opts: opts
      )
    end

    def self.upcoming(params = {}, opts = {})
      request_asaas_object(method: :get, path: "/v1/invoices/upcoming", params: params, opts: opts)
    end

    def self.void_invoice(invoice, params = {}, opts = {})
      request_asaas_object(
        method: :post,
        path: format("/v1/invoices/%<invoice>s/void", { invoice: CGI.escape(invoice) }),
        params: params,
        opts: opts
      )
    end

    def self.search(params = {}, opts = {})
      _search("/v1/invoices/search", params, opts)
    end

    def self.search_auto_paging_each(params = {}, opts = {}, &blk)
      search(params, opts).auto_paging_each(&blk)
    end
  end
end
