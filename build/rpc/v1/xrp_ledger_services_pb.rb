# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: rpc/v1/xrp_ledger.proto for package 'rpc.v1'

require 'grpc'
require 'rpc/v1/xrp_ledger_pb'

module Rpc
  module V1
    module XRPLedgerAPIService
      # RPCs available to interact with the XRP Ledger.
      class Service

        include GRPC::GenericService

        self.marshal_class_method = :encode
        self.unmarshal_class_method = :decode
        self.service_name = 'rpc.v1.XRPLedgerAPIService'

        # Get account info for an account on the XRP Ledger.
        rpc :GetAccountInfo, GetAccountInfoRequest, GetAccountInfoResponse
        # Get the fee for a transaction on the XRP Ledger.
        rpc :GetFee, GetFeeRequest, GetFeeResponse
        # Submit a signed transaction to the XRP Ledger.
        rpc :SubmitTransaction, SubmitTransactionRequest, SubmitTransactionResponse
        # Get the status of a transaction
        rpc :GetTx, GetTxRequest, GetTxResponse
      end

      Stub = Service.rpc_stub_class
    end
  end
end
