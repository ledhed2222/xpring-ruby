# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: currency.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("currency.proto", :syntax => :proto3) do
    add_enum "io.xpring.Currency" do
      value :CURRENCY_INVALID, 0
      value :CURRENCY_USD, 1
    end
  end
end

module Io
  module Xpring
    Currency = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.xpring.Currency").enummodule
  end
end
