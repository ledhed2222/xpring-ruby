# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: signed_transaction.proto

require 'google/protobuf'

require 'transaction_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("signed_transaction.proto", :syntax => :proto3) do
    add_message "io.xpring.SignedTransaction" do
      optional :transaction, :message, 1, "io.xpring.Transaction"
      optional :transaction_signature_hex, :string, 2
    end
  end
end

module Io
  module Xpring
    SignedTransaction = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.xpring.SignedTransaction").msgclass
  end
end
