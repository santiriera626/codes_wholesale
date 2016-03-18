# CodesWholesale

A Ruby interface to the [CodesWholesale](http://codeswholesale.com) API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codes_wholesale'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codes_wholesale

## Usage

```ruby
# Authentication

client = CodesWholesale::Client.new(client_id: "ff72ce315d1259e822f47d87d02d261e", client_secret: "$2a$10$E2jVWDADFA5gh6zlRVcrlOOX01Q/HJoT6hXuDMJxek.YEo.lkO2T6")
response = client.authenticate
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/terenceponce/codes_wholesale. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

