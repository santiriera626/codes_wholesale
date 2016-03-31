require 'codes_wholesale/models/account'

module CodesWholesale
  class Client

    # Methods for the Accounts API
    #
    # @see https://docs.codeswholesale.com/api-documentation
    module Accounts

      # Return the current account details
      #
      # @return [CodesWholesale::Models::Account] Account of the authenticated user
      # @see https://docs.codeswholesale.com/api-documentation/#api-account-details
      # @example Get current account details
      #   CodesWholesale.account
      def account
        CodesWholesale::Models::Account.new(get('accounts/current'))
      end
    end
  end
end
