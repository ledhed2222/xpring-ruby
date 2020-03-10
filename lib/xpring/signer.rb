# frozen_string_literal: true

require "json"
require "xpring/javascript"
require "xpring/util"

module Xpring
  # Signs transactions
  module Signer
    # @param transaction_hash [Hash]
    # @param from_wallet [Wallet]
    # @return [String]
    def self.sign(transaction_hash:, from_wallet:)
      bytes = Javascript.run do
        <<~JAVASCRIPT
          #{Javascript::ENTRY_POINT}.Signer.signTransactionFromJSON(
            JSON.parse('#{JSON.generate(transaction_hash)}'),
            #{from_wallet.to_javascript},
          );
        JAVASCRIPT
      end.values
      Util.byte_string_from_hex_bytes(bytes)
    end
  end
end
