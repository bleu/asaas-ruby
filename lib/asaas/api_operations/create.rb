# frozen_string_literal: true

module Asaas
  module APIOperations
    module Create
      def create(params = {}, opts = {})
        request_asaas_object(
          method: :post,
          path: resource_url,
          params: params,
          opts: opts
        )
      end
    end
  end
end
