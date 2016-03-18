require 'test_helper'

class ClientTest < Minitest::Test
  def test_it_authenticates_successfully
    VCR.use_cassette('successful_authentication') do
      client = CodesWholesale::Client.new(client_id: 'ff72ce315d1259e822f47d87d02d261e',
                                          client_secret: '$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6')
      connection = client.authenticate

      assert_equal '9eba2cac-ec89-47ec-a599-af8923823193', client.access_token
      assert_equal 'bearer', client.token_type
      assert_equal 288, client.expires_in
    end
  end
end
