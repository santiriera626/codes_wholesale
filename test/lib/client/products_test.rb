require 'test_helper'

class ProductTest < Minitest::Test
  def setup
    @client = CodesWholesale::Client.new(client_id: 'ff72ce315d1259e822f47d87d02d261e',
                                        client_secret: '$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6',
                                        environment: 'test')
  end

  def test_it_returns_single_preorder_product
    VCR.use_cassette('products/return_single_preorder_product') do
      product = @client.products('33e3e81d-2b78-475a-8886-9848116f5133')

      assert_equal '33e3e81d-2b78-475a-8886-9848116f5133', product.id
      assert_equal 'TPP', product.identifier
      assert_equal 'Test pre order product', product.name
      assert_equal 'Origin', product.platform
      assert_equal 0, product.quantity
      assert_equal ['ASIA'], product.regions
      assert_equal ['Multilanguage'], product.languages

      assert_equal 0.1, product.prices.first.value
      assert_equal 100, product.prices.first.from
      assert_equal nil, product.prices.first.to

      assert_equal 0.4, product.prices.last.value
      assert_equal 10, product.prices.last.from
      assert_equal 99, product.prices.last.to

      assert_equal '2055-04-30T22:00:00.000Z', product.release_date
    end
  end

  def test_it_returns_single_high_priced_product
    VCR.use_cassette('products/return_single_high_priced_product') do
      product = @client.products('04aeaf1e-f7b5-4ba9-ba19-91003a04db0a')

      assert_equal '04aeaf1e-f7b5-4ba9-ba19-91003a04db0a', product.id
      assert_equal 'TPWHP', product.identifier
      assert_equal 'Test product with high price', product.name
      assert_equal 'None', product.platform
      assert_equal 0, product.quantity
      assert_equal ['WORLDWIDE'], product.regions
      assert_equal ['Multilanguage'], product.languages

      assert_equal 1038999996.88, product.prices.first.value
      assert_equal 100, product.prices.first.from
      assert_equal 0, product.prices.first.to

      assert_equal 1038999998.96, product.prices.last.value
      assert_equal 1, product.prices.last.from
      assert_equal 9, product.prices.last.to

      assert_equal nil, product.release_date
    end
  end

  def test_it_returns_single_image_code_product
    VCR.use_cassette('products/return_single_image_code_product') do
      product = @client.products('6313677f-5219-47e4-a067-7401f55c5a3a')

      assert_equal '6313677f-5219-47e4-a067-7401f55c5a3a', product.id
      assert_equal 'TWICO', product.identifier
      assert_equal 'Test with image codes only', product.name
      assert_equal 'Steam', product.platform
      assert_equal 0, product.quantity
      assert_equal ['EU'], product.regions
      assert_equal ['fr'], product.languages

      assert_equal 0.1, product.prices.first.value
      assert_equal 100, product.prices.first.from
      assert_equal nil, product.prices.first.to

      assert_equal 1.1, product.prices.last.value
      assert_equal 1, product.prices.last.from
      assert_equal 9, product.prices.last.to

      assert_equal nil, product.release_date
    end
  end

  def test_it_returns_single_text_code_product
    VCR.use_cassette('products/return_single_text_code_product') do
      product = @client.products('ffe2274d-5469-4b0f-b57b-f8d21b09c24c')

      assert_equal 'ffe2274d-5469-4b0f-b57b-f8d21b09c24c', product.id
      assert_equal 'TWTCO', product.identifier
      assert_equal 'Test with text codes only', product.name
      assert_equal 'Uplay', product.platform
      assert_equal 0, product.quantity
      assert_equal ['PL'], product.regions
      assert_equal ['pl'], product.languages

      assert_equal 1.11, product.prices.first.value
      assert_equal 1, product.prices.first.from
      assert_equal 9, product.prices.first.to

      assert_equal 0.41, product.prices.last.value
      assert_equal 10, product.prices.last.from
      assert_equal 99, product.prices.last.to

      assert_equal nil, product.release_date
    end
  end

  def test_it_returns_all_products
    VCR.use_cassette('products/return_all_products') do
      products = @client.products

      assert_equal 4, products.count
      assert_equal '33e3e81d-2b78-475a-8886-9848116f5133', products.first.id
      assert_equal 'ffe2274d-5469-4b0f-b57b-f8d21b09c24c', products.last.id
    end
  end
end
