# frozen_string_literal: true

require "xpring/javascript"
require "xpring/error"

module Xpring
  class Wallet
    INVALID_MNEMONIC_OR_DERIVATION_PATH_MSG = "Invalid mnemonic or derivation path"
    SIGN_ERROR_MSG = "Could not sign input"
    private_constant :INVALID_MNEMONIC_OR_DERIVATION_PATH_MSG, :SIGN_ERROR_MSG

    attr_reader :public_key, :private_key, :test

    # @param mnemonic [#to_s]
    # @param derivation_path [#to_s, nil]
    # @param test [true, false]
    # @raise [Xpring::Error]
    # @return [Xpring::Wallet]
    def self.from_mnemonic(mnemonic, derivation_path: nil, test: false)
      result = Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Wallet.generateWalletFromMnemonic(
          '#{mnemonic.to_s}',
          '#{derivation_path&.to_s}' ||
            EntryPoint.Wallet.getDefaultDerivationPath(),
          #{test},
        );
        JAVASCRIPT
      end

      raise Error.new(INVALID_MNEMONIC_OR_DERIVATION_PATH_MSG) if result.nil?
      new(result[:publicKey], result[:privateKey], result[:test])
    end

    # @param seed [#to_s]
    # @param derivation_path [#to_s, nil]
    # @param test [true, false]
    # @return [Xpring::Wallet]
    def self.from_seed(seed, deriviation_path: nil, test: false)
      result = Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Wallet.generateHDWalletFromSeed(
          '#{seed.to_s}',
          '#{derivation_path&.to_s}' ||
            EntryPoint.Wallet.getDefaultDerivationPath(),
          #{test},
        );
        JAVASCRIPT
      end
      new(result[:publicKey], result[:privateKey], result[:test])
    end

    # @raise [NotImplementedError]
    def self.random
      raise NotImplementedError.new("Not compatible with node")
    end

    # @param public_key [#to_s]
    # @param private_key [#to_s]
    # @param test [true, false]
    def initialize(public_key, private_key, test)
      @public_key = public_key.to_s
      @private_key = private_key.to_s
      @test = test
    end

    # @return [String]
    def address
      @address ||= Javascript.run do
        <<-JAVASCRIPT
        #{inject_wallet_as("wallet")}
        wallet.getAddress();
        JAVASCRIPT
      end
    end

    # @param input [#to_s]
    # @raise [Xpring::Error]
    # @return [String]
    def sign(input)
      signed = Javascript.run do
        <<-JAVASCRIPT
        #{inject_wallet_as("wallet")}
        wallet.sign('#{input.to_s}');
        JAVASCRIPT
      end
      raise Error.new(SIGN_ERROR_MSG) if signed.nil?
      signed
    end

    # @param message [#to_s]
    # @param signature [#to_s]
    # @return [true, false]
    def valid?(message, signature)
      Javascript.run do
        <<-JAVASCRIPT
        #{inject_wallet_as("wallet")}
        wallet.verify('#{message.to_s}', '#{signature.to_s}');
        JAVASCRIPT
      end == true
    end

    private

    def inject_wallet_as(var_name)
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

