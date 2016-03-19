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

    def connection
      Faraday.new(url: api_endpoint) do |faraday|
        faraday.request :oauth2, token.token
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    def request(method, url, options = {})
      connection.send(method.to_sym, url, options)
    end
  end
end
