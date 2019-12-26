# frozen_string_literal: true

require_relative "./javascript"
require_relative "./error"

module Xpring
  class Wallet
    INVALID_MNEMONIC_OR_DERIVATION_PATH_MSG = "Invalid mnemonic or derivation path"
    SIGN_ERROR_MSG = "Could not sign input"

    attr_reader :public_key, :private_key, :test

    def self.from_mnemonic(mnemonic, derivation_path: nil, test: false)
      result = Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Wallet.generateWalletFromMnemonic(
          '#{mnemonic}',
          '#{derivation_path}' ||
            EntryPoint.Wallet.getDefaultDerivationPath(),
          #{test},
        );
        JAVASCRIPT
      end

      if result.nil?
        raise Error.new(INVALID_MNEMONIC_OR_DERIVATION_PATH_MSG)
      end
      new(result[:publicKey], result[:privateKey], result[:test])
    end

    def self.from_seed(seed, deriviation_path: nil, test: false)
      result = Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Wallet.generateHDWalletFromSeed(
          '#{seed}',
          '#{derivation_path}' ||
            EntryPoint.Wallet.getDefaultDerivationPath(),
          #{test},
        );
        JAVASCRIPT
      end
      new(result[:publicKey], result[:privateKey], result[:test])
    end

    def self.random
      raise NotImplementedError.new("Not compatible with node")
    end

    def initialize(public_key, private_key, test)
      @public_key = public_key
      @private_key = private_key
      @test = test
    end

    def address
      @address ||= Javascript.run do
        <<-JAVASCRIPT
        #{assign_wallet_to("wallet")}
        wallet.getAddress();
        JAVASCRIPT
      end
    end

    def sign(input)
      signed = Javascript.run do
        <<-JAVASCRIPT
        #{assign_wallet_to("wallet")}
        wallet.sign('#{input}');
        JAVASCRIPT
      end
      if signed.nil?
        raise Error.new(SIGN_ERROR_MSG)
      end
      signed
    end

    def valid?(message, signature)
      Javascript.run do
        <<-JAVASCRIPT
        #{assign_wallet_to("wallet")}
        wallet.verify('#{message}', '#{signature}');
        JAVASCRIPT
      end == true
    end

    private

    def assign_wallet_to(var_name)
      <<-JAVASCRIPT
      const #{var_name} = new EntryPoint.Wallet(
        '#{public_key}',
        '#{private_key}',
        #{test},
      );
      JAVASCRIPT
    end
  end
end

