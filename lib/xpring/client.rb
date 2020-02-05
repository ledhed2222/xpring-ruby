# frozen_string_literal: true

require "xrp_amount_pb"
require "xrp_ledger_pb"

module Xpring
  class Client
    attr_reader :grpc_url

    def initialize(grpc_url)
      @grpc_url = grpc_url
    end

    def balance_of(address)
    end
  end
end

