require 'codes_wholesale/models/product'

module CodesWholesale
  class Client
    module Products
      def products(id = nil)
        if id.nil?
          products = get('products')
          products[:items].map { |attributes| CodesWholesale::Models::Product.new(attributes) }
        else
          CodesWholesale::Models::Product.new(get("products/#{id}"))
        end
      end
    end
  end
end
