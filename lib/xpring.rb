# frozen_string_literal: true

require "xpring/version"
require "xpring/wallet"
require "xpring/util"
require "xpring/client"
require "xpring/error"

module Xpring
  @@debug = false

  # @return [true, false]
  def self.debug?
    @@debug
  end

  # @param value [true, false]
  # @raise [TypeError]
  # @return [true, false]
  def self.debug=(value)
    raise TypeError if ![true, false].include?(value)
    @@debug = value
  end

  # @param value [#to_s]
  # @return [nil]
  def self.debug_log(value)
    puts value if debug?
  end
end

