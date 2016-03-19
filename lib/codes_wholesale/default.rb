module CodesWholesale
  module Default
    ENVIRONMENT = 'production'.freeze

    class << self
      def options
        Hash[CodesWholesale::Configurable.keys.map { |key| [key, send(key)] }]
      end

      def api_domain
        ENV['CODES_WHOLESALE_API_DOMAIN'] ||= API_DOMAIN
      end

      def environment
        ENV['CODES_WHOLESALE_ENVIRONMENT'] ||= ENVIRONMENT
      end

      def client_id
        ENV['CODES_WHOLESALE_CLIENT_ID']
      end

      def client_secret
        ENV['CODES_WHOLESALE_CLIENT_SECRET']
      end
    end
  end
end
