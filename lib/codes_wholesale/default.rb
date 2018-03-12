require 'codes_wholesale/version'

module CodesWholesale

  # Default configuration options for {Client}
  module Default

    # Default API environment
    ENVIRONMENT = 'production'.freeze

    # Default API version
    API_VERSION = 'v2'.freeze

    # Default User-Agent header string
    USER_AGENT = "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0".freeze

    class << self

      # Configuration options
      # @return [Hash[
      def options
        Hash[CodesWholesale::Configurable.keys.map { |key| [key, send(key)] }]
      end

      # Default API version
      # @return [String]
      def api_version
        ENV['CODES_WHOLESALE_API_VERSION'] ||= API_VERSION
      end

      # Default API environment
      # @ return [String]
      def environment
        ENV['CODES_WHOLESALE_ENVIRONMENT'] ||= ENVIRONMENT
      end

      # Default OAuth app key from ENV
      # @return [String]
      def client_id
        ENV['CODES_WHOLESALE_CLIENT_ID']
      end


      # Default OAuth app secret from ENV
      # @return [String]
      def client_secret
        ENV['CODES_WHOLESALE_SECRET']
      end

      # Default User-Agent header string from ENV or {USER_AGENT}
      # @return [String]
      def user_agent
        ENV['CODES_WHOLESALE_USER_AGENT'] || USER_AGENT
      end
    end
  end
end
