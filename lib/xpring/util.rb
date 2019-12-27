# frozen_string_literal: true

require "xpring/javascript"

module Xpring
  module Util
    def self.valid_address?(address)
      Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Utils.isValidAddress('#{address}');
        JAVASCRIPT
      end == true
    end

    def self.valid_x_address?(address)
      Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Utils.isValidXAddress('#{address}');
        JAVASCRIPT
      end == true
    end

    def self.valid_classic_address?(address)
      Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Utils.isValidClassicAddress('#{address}');
        JAVASCRIPT
      end == true
    end

    def self.encode(classic_address, tag: nil, test: false)
      Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Utils.encodeXAddress('#{classic_address}', #{tag}, #{test});
        JAVASCRIPT
      end
    end

    def self.decode(x_address)
      Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Utils.decodeXAddress('#{x_address}');
        JAVASCRIPT
      end
    end
  end
end

