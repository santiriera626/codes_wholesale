module CodesWholesale
  module Models
    class CwProduct
      attr_reader :id, :identifier, :name, :platform, :quantity, :images,
                  :regions, :languages, :prices, :links, :release_date

      def initialize(opts = {})
        @id           = opts[:productId]
        @identifier   = opts[:identifier]
        @name         = opts[:name]
        @platform     = opts[:platform]
        @quantity     = opts[:quantity]
        @images       = opts[:images]
        @regions      = opts[:regions]
        @languages    = opts[:languages]
        @prices       = opts[:prices]
        @links        = opts[:links]
        @release_date = opts[:releaseDate]
      end
    end
  end
end
