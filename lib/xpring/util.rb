# frozen_string_literal: true

require "xpring/javascript"

module Xpring
  # Various utilities
  module Util
    # @param address [#to_s]
    # @return [true, false]
    def self.valid_address?(address)
      Javascript.run do
        <<~JAVASCRIPT
          #{Javascript::ENTRY_POINT}.Utils.isValidAddress('#{address}');
        JAVASCRIPT
      end == true
    end

    # @param address [#to_s]
    # @return [true, false]
    def self.valid_x_address?(address)
      Javascript.run do
        <<~JAVASCRIPT
          #{Javascript::ENTRY_POINT}.Utils.isValidXAddress('#{address}');
        JAVASCRIPT
      end == true
    end

    # @param address [#to_s]
    # @return [true, false]
    def self.valid_classic_address?(address)
      Javascript.run do
        <<~JAVASCRIPT
          #{Javascript::ENTRY_POINT}.Utils.isValidClassicAddress('#{address}');
        JAVASCRIPT
      end == true
    end

    # @param classic_address [#to_s]
    # @param tag [#to_s, nil]
    # @param test [true, false]
    # @return [String]
    def self.encode(classic_address, tag: nil, test: false)
      Javascript.run do
        <<~JAVASCRIPT
          #{Javascript::ENTRY_POINT}.Utils.encodeXAddress('#{classic_address}', #{tag&.to_s}, #{test});
        JAVASCRIPT
      end
    end

    # @param x_address [#to_s]
    # @return [Hash<Symbol, Object>]
    def self.decode(x_address)
      Javascript.run do
        <<~JAVASCRIPT
          #{Javascript::ENTRY_POINT}.Utils.decodeXAddress('#{x_address}');
        JAVASCRIPT
      end
    end

    # @param input [#to_s]
    # @return [Array<Integer>]
    def self.hex_bytes_from_string(input)
      input.to_s.chars.each_slice(2).map do |*pair|
        pair.join.hex
      end
    end

    # @param input [Array<Integer>]
    # @return [String]
    def self.byte_string_from_hex_bytes(input)
      input.pack("C*")
    end

    # @param input [#to_s]
    # @return [String]
    def self.byte_string_from_string(input)
      byte_string_from_hex_bytes(
        hex_bytes_from_string(input),
      )
    end
  end
end
