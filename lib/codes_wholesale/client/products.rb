require 'codes_wholesale/models/product'

module CodesWholesale
  class Client
    module Products
      def products(id)
        CodesWholesale::Models::Product.new(get("products/#{id}"))
      end
    end
  end
end
