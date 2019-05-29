# frozen_string_literal: true

# Recipients objects are deprecated. Please use Stripe Connect instead.
module Stripe
  class Recipient < APIResource
    extend Stripe::APIOperations::Create
    include Stripe::APIOperations::Delete
    extend Stripe::APIOperations::List
    include Stripe::APIOperations::Save

    OBJECT_NAME = "recipient".freeze

    def transfers
      Transfer.all({ recipient: id }, @api_key)
    end
  end
end
