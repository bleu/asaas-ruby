# frozen_string_literal: true

module Asaas
  # Asaas needs to collect certain pieces of information about each account
  # created. These requirements can differ depending on the account's country. The
  # Country Specs API makes these rules available to your integration.
  #
  # You can also view the information from this API call as [an online
  # guide](https://asaas.com/docs/connect/required-verification-information).
  class CountrySpec < APIResource
    extend Asaas::APIOperations::List

    OBJECT_NAME = "country_spec"
  end
end
