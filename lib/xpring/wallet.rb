# frozen_string_literal: true

require "xpring/javascript"
require "xpring/error"

module Xpring
  # Representation of a XRP wallet
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
        <<~JAVASCRIPT
          #{Javascript::ENTRY_POINT}.Wallet.generateWalletFromMnemonic(
            '#{mnemonic}',
            '#{derivation_path&.to_s}' ||
              #{Javascript::ENTRY_POINT}.Wallet.getDefaultDerivationPath(),
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
    def self.from_seed(seed, derivation_path: nil, test: false)
      result = Javascript.run do
        <<~JAVASCRIPT
          #{Javascript::ENTRY_POINT}.Wallet.generateHDWalletFromSeed(
            '#{seed}',
            '#{derivation_path&.to_s}' ||
              #{Javascript::ENTRY_POINT}.Wallet.getDefaultDerivationPath(),
            #{test},
          );
        JAVASCRIPT
      end
      new(result[:publicKey], result[:privateKey], result[:test])
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
        <<~JAVASCRIPT
          #{to_javascript}.getAddress();
        JAVASCRIPT
      end
    end

    # @param input [#to_s]
    # @raise [Xpring::Error]
    # @return [String]
    def sign(input)
      signed = Javascript.run do
        <<~JAVASCRIPT
          #{to_javascript}.sign('#{input}');
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
        <<~JAVASCRIPT
          #{to_javascript}.verify('#{message}', '#{signature}');
        JAVASCRIPT
      end == true
    end

    # @return [String] Javascript constructor expression for this Wallet
    def to_javascript
      <<~JAVASCRIPT
        new #{Javascript::ENTRY_POINT}.Wallet(
          '#{public_key}',
          '#{private_key}',
          #{test},
        )
      JAVASCRIPT
    end
  end
end
