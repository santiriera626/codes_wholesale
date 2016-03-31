module CodesWholesale
  module Models
    class Account
      attr_reader :full_name, :email, :current_balance, :current_credit, :total_to_use

      def initialize(opts = {})
        @full_name       = opts[:fullName]
        @email           = opts[:email]
        @current_balance = opts[:currentBalance]
        @current_credit  = opts[:currentCredit]
        @total_to_use    = opts[:totalToUse]
      end
    end
  end
end
