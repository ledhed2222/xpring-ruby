# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: submit_signed_transaction_response.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("submit_signed_transaction_response.proto", :syntax => :proto3) do
    add_message "io.xpring.SubmitSignedTransactionResponse" do
      optional :engine_result, :string, 1
      optional :engine_result_code, :int64, 2
      optional :engine_result_message, :string, 3
      optional :transaction_blob, :string, 4
    end
  end
end

module Io
  module Xpring
    SubmitSignedTransactionResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("io.xpring.SubmitSignedTransactionResponse").msgclass
  end
end
