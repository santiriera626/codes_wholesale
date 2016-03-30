require 'codes_wholesale/configurable'

module CodesWholesale
  class Client
    include CodesWholesale::Configurable

    def initialize(options = {})
      CodesWholesale::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || CodesWholesale.instance_variable_get(:"@#{key}"))
      end
    end

    def token
      OAuth2::Client.new(client_id, client_secret, site: "#{api_endpoint}/oauth/token").client_credentials.get_token
    end

    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint, sawyer_options) do |http|
        http.headers[:content_type] = 'application/json'
        http.headers[:user_agent] = user_agent
        http.authorization :Bearer, token.token
        http.response :logger
        http.adapter Faraday.default_adapter
      end
    end

    def get(url, options = {})
      request(:get, url, options)
    end

    def post(url, options = {})
      request(:post, url, options)
    end

    private

      def request(method, url, options = {})
        @last_response = response = agent.call(method, URI::Parser.new.escape(url.to_s), options)
        response.data
      end

      def sawyer_options
        { link_parser: Sawyer::LinkParsers::Simple.new }
      end
  end
end
