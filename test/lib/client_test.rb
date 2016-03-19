require 'test_helper'

class ClientTest < Minitest::Test
  def test_it_configures_through_a_block
    CodesWholesale.configure do |config|
      config.client_id = 'ff72ce315d1259e822f47d87d02d261e'
      config.client_secret = '$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6'
    end

    assert_equal 'ff72ce315d1259e822f47d87d02d261e', CodesWholesale.client_id
    assert_equal '$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6', CodesWholesale.client_secret
  end

  def test_it_configures_through_a_hash
    client = CodesWholesale::Client.new(client_id: 'ff72ce315d1259e822f47d87d02d261e',
                                        client_secret: '$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6')

    assert_equal 'ff72ce315d1259e822f47d87d02d261e', client.client_id
    assert_equal '$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6', client.client_secret
  end

  def test_it_authenticates_successfully
    VCR.use_cassette('successful_authentication') do
      client = CodesWholesale::Client.new(client_id: 'ff72ce315d1259e822f47d87d02d261e',
                                          client_secret: '$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6',
                                          environment: 'test')
      token = client.token

      assert_equal '9c246bae-03cb-4fb7-bbd5-b704cc09e159', token.token
      assert_equal 'bearer', token.params['token_type']
      assert_equal 266, token.expires_in
    end
  end
end
