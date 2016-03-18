module CodesWholesale
  class Client
    attr_accessor :client_id, :client_secret, :access_token, :token_type, :expires_in

    def initialize(opts = {})
      @client_id = opts[:client_id]
      @client_secret = opts[:client_secret]
    end

    def authenticate
      connection = Faraday.new(url: CodesWholesale::API_URL) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end

      options = {
        grant_type: 'client_credentials',
        client_id: client_id,
        client_secret: client_secret
      }

      response = connection.post('/oauth/token', options)

      response_body = JSON.parse(response.body)
      self.access_token = response_body['access_token']
      self.token_type = response_body['token_type']
      self.expires_in = response_body['expires_in']
    end
  end
end
