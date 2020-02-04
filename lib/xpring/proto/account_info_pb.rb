# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: account_info.proto

require 'google/protobuf'

require 'xrp_amount_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("account_info.proto", :syntax => :proto3) do
    add_message "io.xpring.AccountInfo" do
      optional :balance, :message, 1, "io.xpring.XRPAmount"
      optional :sequence, :uint64, 2
      optional :owner_count, :uint64, 3
      optional :previous_affecting_transaction_id, :string, 4
      optional :previous_affecting_transaction_ledger_version, :uint64, 5
    end
  end
end

module Io
  module Xpring
    AccountInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("io.xpring.AccountInfo").msgclass
  end
end
