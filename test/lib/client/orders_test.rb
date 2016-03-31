require 'test_helper'

class OrdersTest < Minitest::Test
  def setup
    @client = CodesWholesale::Client.new(client_id: 'ff72ce315d1259e822f47d87d02d261e',
                                         client_secret: '$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6',
                                         environment: 'test')
  end

  def test_it_preorders_a_product
    VCR.use_cassette('orders/preorder_a_product') do
      order = @client.order('33e3e81d-2b78-475a-8886-9848116f5133')

      assert_equal 'CODE_PREORDER', order.code_type
    end
  end
end
