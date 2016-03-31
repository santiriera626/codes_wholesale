require 'codes_wholesale/models/order'

module CodesWholesale
  class Client
    module Orders
      def order(product_id)
        CodesWholesale::Models::Order.new(post("orders?productId=#{product_id}"))
      end
    end
  end
end
