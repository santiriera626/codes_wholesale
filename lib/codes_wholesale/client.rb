require 'codes_wholesale/configurable'
require 'codes_wholesale/client/accounts'
require 'codes_wholesale/client/cw_products'
require 'codes_wholesale/client/orders'

module CodesWholesale

  # Client for the CodesWholesale API
  #
  # @see https://docs.codeswholesale.com/api-documentation/
  class Client
    include CodesWholesale::Configurable
    include CodesWholesale::Client::Accounts
    include CodesWholesale::Client::CwProducts
    include CodesWholesale::Client::Orders

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      CodesWholesale::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || CodesWholesale.instance_variable_get(:"@#{key}"))
      end
      @token = token
    end

    # Authenticates and get the token in order to make requests to the API
    #
    # @return [OAuth2::AccessToken]
    def token
      OAuth2::Client.new(client_id, client_secret, site: "#{api_endpoint}/oauth/token").client_credentials.get_token
    end

    # Make a HTTP GET request
    #
    # @param url [String] The path relative to {#api_endpoint}
    # @param options [Hash] Query and other params for the request
    # @return [Sawyer::Resource]
    def get(url, options = {})
      request(:get, url, options)
    end

    # Make a HTTP POST request
    #
    # @param url [String] The path relative to {#api_endpoint}
    # @param options [Hash] Query and other params for the request
    # @return [Sawyer::Resource]
    def post(url, options = {})
      request(:post, url, options)
    end

    private

      def request(method, url, options = {})
        options[:headers] ||= {}
        options[:headers]["Authorization"] = "Bearer #{@token.token}"
        @last_response = response = HTTParty.send(method,
           URI::Parser.new.escape("#{api_endpoint}/#{url.to_s}"),
           options
        )
        response.deep_symbolize_keys
      end

      def sawyer_options
        { link_parser: Sawyer::LinkParsers::Simple.new }
      end
  end
end
