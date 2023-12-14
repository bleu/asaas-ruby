# frozen_string_literal: true

module Asaas
  module APIOperations
    module Search
      def _search(search_url, filters = {}, opts = {})
        request_asaas_object(
          method: :get,
          path: search_url,
          params: filters,
          opts: opts
        )
      end
    end
  end
end
