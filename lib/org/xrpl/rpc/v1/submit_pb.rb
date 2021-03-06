# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: org/xrpl/rpc/v1/submit.proto

require 'google/protobuf'

require 'org/xrpl/rpc/v1/meta_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("org/xrpl/rpc/v1/submit.proto", :syntax => :proto3) do
    add_message "org.xrpl.rpc.v1.SubmitTransactionRequest" do
      optional :signed_transaction, :bytes, 1
      optional :fail_hard, :bool, 2
    end
    add_message "org.xrpl.rpc.v1.SubmitTransactionResponse" do
      optional :engine_result, :message, 1, "org.xrpl.rpc.v1.TransactionResult"
      optional :engine_result_code, :int64, 2
      optional :engine_result_message, :string, 3
      optional :hash, :bytes, 4
    end
  end
end

module Org
  module Xrpl
    module Rpc
      module V1
        SubmitTransactionRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SubmitTransactionRequest").msgclass
        SubmitTransactionResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SubmitTransactionResponse").msgclass
      end
    end
  end
end
