# Xpring

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/xpring`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'xpring'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xpring

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/xpring.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


# TODO

- tx status...
- sending xrp
- what is the compilation story for this gem?
    to recompile proto files after pulling from rippled submodule:
    `grpc_tools_ruby_protoc --proto_path=./rippled/src/ripple/proto
    --ruby_out=lib --grpc_out=lib
    ./rippled/src/ripple/proto/org/xrpl/rpc/v1/*.proto`
    to recompile js files after pulling from xpring-common-js submodule:
    `cd xpring-common-js`
    `npm i`
    `npm run webpack`
    `cp dist/index.js ../ext/xpring/xpring.js`

- grpc deadlines?
- tests
- rubocop?
- ruby docs
