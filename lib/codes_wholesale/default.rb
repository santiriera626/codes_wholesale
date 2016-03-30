require 'codes_wholesale/version'

module CodesWholesale
  module Default
    ENVIRONMENT = 'production'.freeze
    API_VERSION = 'v1'.freeze
    USER_AGENT = "CodesWholesale Ruby Gem #{CodesWholesale::VERSION}".freeze

    class << self
      def options
        Hash[CodesWholesale::Configurable.keys.map { |key| [key, send(key)] }]
      end

      def api_version
        ENV['CODES_WHOLESALE_API_VERSION'] ||= API_VERSION
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

      def user_agent
        ENV['CODES_WHOLESALE_USER_AGENT'] || USER_AGENT
      end
    end
  end
end
