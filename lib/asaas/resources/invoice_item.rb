# frozen_string_literal: true

module Asaas
  # Invoice Items represent the component lines of an [invoice](https://asaas.com/docs/api/invoices). An invoice item is added to an
  # invoice by creating or updating it with an `invoice` field, at which point it will be included as
  # [an invoice line item](https://asaas.com/docs/api/invoices/line_item) within
  # [invoice.lines](https://asaas.com/docs/api/invoices/object#invoice_object-lines).
  #
  # Invoice Items can be created before you are ready to actually send the invoice. This can be particularly useful when combined
  # with a [subscription](https://asaas.com/docs/api/subscriptions). Sometimes you want to add a charge or credit to a customer, but actually charge
  # or credit the customer's card only at the end of a regular billing cycle. This is useful for combining several charges
  # (to minimize per-transaction fees), or for having Asaas tabulate your usage-based billing totals.
  #
  # Related guides: [Integrate with the Invoicing API](https://asaas.com/docs/invoicing/integration), [Subscription Invoices](https://asaas.com/docs/billing/invoices/subscription#adding-upcoming-invoice-items).
  class InvoiceItem < APIResource
    extend Asaas::APIOperations::Create
    include Asaas::APIOperations::Delete
    extend Asaas::APIOperations::List
    include Asaas::APIOperations::Save

    OBJECT_NAME = "invoiceitem"
  end
end
