# frozen_string_literal: true

module Asaas
  module APIOperations
    module List
      def list(filters = {}, opts = {})
        request_asaas_object(
          method: :get,
          path: resource_url,
          params: filters,
          opts: opts
        )
      end
    end
  end
end
