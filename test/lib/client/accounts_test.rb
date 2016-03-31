require 'test_helper'

class AccountsTest < Minitest::Test
  def setup
    @client = CodesWholesale::Client.new(client_id: 'ff72ce315d1259e822f47d87d02d261e',
                                         client_secret: '$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6',
                                         environment: 'test')
  end

  def test_it_returns_current_account_details
    VCR.use_cassette('accounts/return_account_details') do
      account = @client.account

      assert_equal 'Sandbox', account.full_name
      assert_equal 'devteam@sandbox.com', account.email
      assert_equal 999995745.58, account.current_balance
      assert_equal 0, account.current_credit
      assert_equal 999995745.58, account.total_to_use
    end
  end
end
