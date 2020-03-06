# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: org/xrpl/rpc/v1/get_fee.proto

require 'google/protobuf'

require 'org/xrpl/rpc/v1/amount_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("org/xrpl/rpc/v1/get_fee.proto", :syntax => :proto3) do
    add_message "org.xrpl.rpc.v1.GetFeeRequest" do
    end
    add_message "org.xrpl.rpc.v1.GetFeeResponse" do
      optional :current_ledger_size, :uint64, 1
      optional :current_queue_size, :uint64, 2
      optional :fee, :message, 3, "org.xrpl.rpc.v1.Fee"
      optional :expected_ledger_size, :uint64, 4
      optional :ledger_current_index, :uint32, 5
      optional :levels, :message, 6, "org.xrpl.rpc.v1.FeeLevels"
      optional :max_queue_size, :uint64, 7
    end
    add_message "org.xrpl.rpc.v1.Fee" do
      optional :base_fee, :message, 1, "org.xrpl.rpc.v1.XRPDropsAmount"
      optional :median_fee, :message, 2, "org.xrpl.rpc.v1.XRPDropsAmount"
      optional :minimum_fee, :message, 3, "org.xrpl.rpc.v1.XRPDropsAmount"
      optional :open_ledger_fee, :message, 4, "org.xrpl.rpc.v1.XRPDropsAmount"
    end
    add_message "org.xrpl.rpc.v1.FeeLevels" do
      optional :median_level, :uint64, 1
      optional :minimum_level, :uint64, 2
      optional :open_ledger_level, :uint64, 3
      optional :reference_level, :uint64, 4
    end
  end
end

module Org
  module Xrpl
    module Rpc
      module V1
        GetFeeRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.GetFeeRequest").msgclass
        GetFeeResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.GetFeeResponse").msgclass
        Fee = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Fee").msgclass
        FeeLevels = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.FeeLevels").msgclass
      end
    end
  end
end