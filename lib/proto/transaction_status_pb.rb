# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: transaction_status.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("transaction_status.proto", :syntax => :proto3) do
    add_message "io.xpring.TransactionStatus" do
      optional :transaction_status_code, :string, 1
      optional :validated, :bool, 2
      optional :last_ledger_sequence, :uint32, 3
    end
  end
end

module Io
  module Xpring
    TransactionStatus = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.xpring.TransactionStatus").msgclass
  end
end
