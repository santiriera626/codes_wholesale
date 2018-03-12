module CodesWholesale

  # Configuration options for {Client}, defaulting to values in {Default}
  module Configurable
    # @!attribute [w] client_id
    # @return [String] Configure OAuth app key
    # @!attribute [w] client_secret
    # @return [String] Configure OAuth app secret
    # @!attribute [w] environment
    # @return [String] Configure API environment
    # @!attribute user_agent
    # @return [String] Configure User-Agent for requests
    # @!attribute api_version
    # @return [String] Configure API version
    attr_accessor :client_id, :client_secret, :environment,
                  :user_agent, :api_version

    class << self

      # List of configurable keys for {CodesWholesale::Client}
      # @return [Array] of option keys
      def keys
        @keys ||= [
          :client_id,
          :client_secret,
          :environment,
          :user_agent,
          :api_version
        ]
      end
    end

    # Set configuration options through a block
    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      CodesWholesale::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", CodesWholesale::Default.options[key])
      end
      self
    end
    alias setup reset!

    def api_endpoint
      "https://#{api_subdomain}.codeswholesale.com:443/#{@api_version}"
    end

    private

      def api_subdomain
        case environment
        when 'production'
          'api'
        when 'test'
          'sandbox'
        end
      end
  end
end
