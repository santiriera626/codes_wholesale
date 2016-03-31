require 'codes_wholesale/models/account'

module CodesWholesale
  class Client
    module Accounts
      def account
        CodesWholesale::Models::Account.new(get('accounts/current'))
      end
    end
  end
end
