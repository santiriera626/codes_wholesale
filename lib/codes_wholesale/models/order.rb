module CodesWholesale
  module Models
    class Order
      attr_reader :code_type

      def initialize(opts = {})
        @code_type = opts[:codeType]
      end
    end
  end
end
