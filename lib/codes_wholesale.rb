require "codes_wholesale/client"
require "codes_wholesale/configurable"
require "codes_wholesale/default"
require "codes_wholesale/version"
require 'faraday'
require 'sawyer'
require 'oauth2'
require 'json'

module CodesWholesale
  class << self
    include CodesWholesale::Configurable
  end
end

CodesWholesale.setup
