$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'codes_wholesale'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'
require 'byebug'

VCR.configure do |config|
  config.cassette_library_dir = 'test/fixtures'
  config.hook_into :webmock
end

CodesWholesale::API_URL = 'https://sandbox.codeswholesale.com'
