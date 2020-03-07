# frozen_string_literal: true

require "xpring/javascript"

module Xpring
  module Util
    # @param address [#to_s]
    # @return [true, false]
    def self.valid_address?(address)
      Javascript.run do
        <<~JAVASCRIPT
        #{Javascript::ENTRY_POINT}.Utils.isValidAddress('#{address.to_s}');
        JAVASCRIPT
      end == true
    end

    # @param address [#to_s]
    # @return [true, false]
    def self.valid_x_address?(address)
      Javascript.run do
        <<~JAVASCRIPT
        #{Javascript::ENTRY_POINT}.Utils.isValidXAddress('#{address.to_s}');
        JAVASCRIPT
      end == true
    end

    # @param address [#to_s]
    # @return [true, false]
    def self.valid_classic_address?(address)
      Javascript.run do
        <<~JAVASCRIPT
        #{Javascript::ENTRY_POINT}.Utils.isValidClassicAddress('#{address.to_s}');
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
        #{Javascript::ENTRY_POINT}.Utils.encodeXAddress('#{classic_address.to_s}', #{tag&.to_s}, #{test});
        JAVASCRIPT
      end
    end

    # @param x_address [#to_s]
    # @return [String]
    def self.decode(x_address)
      Javascript.run do
        <<~JAVASCRIPT
        #{Javascript::ENTRY_POINT}.Utils.decodeXAddress('#{x_address.to_s}');
        JAVASCRIPT
      end
    end

    # @param hex_string [#to_s]
    # @return [String]
    def self.byte_string_from(hex_string)
      hex_string.to_s.chars.each_slice(2).map do |*pair|
        pair.join.hex
      end.pack("C*")
    end
  end
end

