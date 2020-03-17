# Xpring

Xpring-Ruby is the Ruby client-side library for the Xpring SDK. It allows you
to interact with the XRP ledger.

## Installation

### NOTE!

You must have `node` on your path for this gem to work! If you must use a
different JS runtime, please drop us a line.

---

Add this line to your application's Gemfile:

```ruby
gem 'xpring'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xpring

## Usage
### Wallets
A wallet is a fundamental model object in XpringKit which provides key management, address derivation, and signing functionality. Wallets can be derived from either a seed or a mnemonic and derivation path.

#### Wallet Derivation
xpring can derive a wallet from a seed or it can derive a hierarchical deterministic wallet from a mnemonic and derivation path.

##### Hierarchical Deterministic Wallets
A hierarchical deterministic wallet is created using a mnemonic. Simply pass the mnemonic to the wallet generation function.

```ruby
mnemonic = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
wallet = Xpring::Wallet.from_mnemonic(mnemonic)
```

##### Seed-based Wallets
You can construct a seed based wallet by passing a base58check encoded seed string.

```ruby
wallet = Xpring::Wallet.from_seed("snRiAJGeKCkPVddbjB3zRwiYDBm1M")
```

#### Wallet Properties
A generated wallet can provide its public key, private key, and address on the XRP ledger.

```ruby
mnemonic = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
wallet = Xpring::Wallet.from_mnemonic(mnemonic)
puts wallet.address
puts wallet.public_key
puts wallet.private_key
```

### Client
`Xpring::Client` is a gateway into the XRP Ledger. It is initialized with the URL of the remote adapter.

```ruby
client = Xpring::Client.new("test.xrp.xpring.io:50051")
```

#### Retrieving a Balance
A client can check the balance of an account on the XRP ledger.

```ruby
client = Xpring::Client.new("test.xrp.xpring.io:50051")
address = "X7u4MQVhU2YxS4P9fWzQjnNuDRUkP3GM6kiVjTjcQgUU3Jr"
balance = client.balance_of(address)
puts balance
```

#### Checking Transaction Status
A client can check the status of a payment on the XRP ledger.

```ruby
client = Xpring::Client.new("test.xrp.xpring.io:50051")
transaction = "9FC7D277C1C8ED9CE133CC17AEA9978E71FC644CE6F5F0C8E26F1C635D97AF4A"
status = client.status_of(transaction)
puts status
```

#### Sending XRP
A client can send XRP to other accounts on the XRP ledger.

```ruby
client = Xpring::Client.new("test.xrp.xpring.io:50051")
amount = 10
destination_addr = "X7u4MQVhU2YxS4P9fWzQjnNuDRUkP3GM6kiVjTjcQgUU3Jr"

# sending wallet
mnemonic = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
sender = Xpring::Wallet.from_mnemonic(mnemonic)

result = client.send_xrp(amount: amount, to: destination_addr, from: sender)
```

#### Utilities
##### Address validation
```ruby
classic_address = "rnysDDrRXxz9z66DmCmfWpq4Z5s4TyUP3G"
x_address = "X7jjQ4d6bz1qmjwxYUsw6gtxSyjYv5iWPqPEjGqqhn9Woti"
bitcoin_address = "1DiqLtKZZviDxccRpowkhVowsbLSNQWBE8"

Xpring::Util.valid_address?(classic_address)        # true
Xpring::Util.valid_address?(x_address)              # true
Xpring::Util.valid_address?(bitcoin_address)        # false 
```

You can also validate if an address is an X-Address or a classic address

```ruby
classic_address = "rnysDDrRXxz9z66DmCmfWpq4Z5s4TyUP3G"
x_address = "X7jjQ4d6bz1qmjwxYUsw6gtxSyjYv5iWPqPEjGqqhn9Woti"
bitcoin_address = "1DiqLtKZZviDxccRpowkhVowsbLSNQWBE8"

Xpring::Util.valid_x_address?(classic_address)    # false
Xpring::Util.valid_x_address?(x_address)          # true
Xpring::Util.valid_x_address?(bitcoin_address)   # false

Xpring::Util.valid_classic_address?(classic_address)  # true
Xpring::Util.valid_classic_address?(x_address)        # false
Xpring::Util.valid_classic_address?(bitcoin_address)  # false
```


## Development
We have a dev dependency with gRPC web.

### Install gRPC Web
#### OSX
`curl -L https://github.com/grpc/grpc-web/releases/download/1.0.7/protoc-gen-grpc-web-1.0.7-darwin-x86_64 --output protoc-gen-grpc-web`

`sudo mv protoc-gen-grpc-web /usr/local/bin/`

`chmod +x /usr/local/bin/protoc-gen-grpc-web`

#### Linux
`curl -L https://github.com/grpc/grpc-web/releases/download/1.0.7/protoc-gen-grpc-web-1.0.7-linux-x86_64 --output protoc-gen-grpc-web`

`sudo mv protoc-gen-grpc-web /usr/local/bin/`

`chmod +x /usr/local/bin/protoc-gen-grpc-web`

### Working with the repo 

You can build the gem for local dev with:
`rake build`

If something goes wrong, try cleaning the generated code with:
`rake clean`


After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/xpring.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


# TODO

- grpc deadlines?
- tests
