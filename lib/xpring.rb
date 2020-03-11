# frozen_string_literal: true

require "xpring/version"
require "xpring/wallet"
require "xpring/util"
require "xpring/client"
require "xpring/error"

# Entrypoint of library
module Xpring
  @debug = false

  # @return [true, false]
  def self.debug?
    @debug
  end

  # @return [true, false]
  def self.toggle_debug!
    @debug = !@debug
  end

  # @param value [#to_s]
  # @return [nil]
  def self.debug_log(value)
    puts value if debug?
  end
end
