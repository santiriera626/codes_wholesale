require 'codes_wholesale/models/order'

module CodesWholesale
  class Client

    # Methods for the Orders API
    #
    # @see https://docs.codeswholesale.com/api-documentation
    module Orders

      # Order a product
      #
      # @param product_id [String] ID of the product
      # @return [CodesWholesale::Models::Order] Order details
      # @see https://docs.codeswholesale.com/api-documentation/#api-single-code
      # @example Order a product
      #   CodesWholesale.order('6313677f-5219-47e4-a067-7401f55c5a3a')
      def order(product_id)
        CodesWholesale::Models::Order.new(post("orders?productId=#{product_id}"))
      end
    end
  end
end
