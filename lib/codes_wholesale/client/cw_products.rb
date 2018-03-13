require 'codes_wholesale/models/cw_product'

module CodesWholesale
  class Client

    # Methods for the Products API
    #
    # @see https://docs.codeswholesale.com/api-documentation
    module CwProducts

      # Get all products or get a specific product
      #
      # @param id [String] ID of the product
      # @return [Array<CodesWholesale::Models::Product>] A list of products
      # @return [CodesWholesale::Models::Product] A product
      # @see https://docs.codeswholesale.com/api-documentation/#api-products-list
      # @see https://docs.codeswholesale.com/api-documentation/#api-id-product
      # @example Get all products
      #   CodesWholesale.products
      # @example Get a specific product
      #   CodesWholesale.products('6313677f-5219-47e4-a067-7401f55c5a3a')
      def products(id = nil, params = {})
        if id.nil?
          products = get('products', {query: params})
          products[:items].map { |attributes| CodesWholesale::Models::CwProduct.new(attributes) }
        else
          CodesWholesale::Models::CwProduct.new(get("products/#{id}"))
        end
      end
    end
  end
end
