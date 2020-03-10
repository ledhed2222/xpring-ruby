# frozen_string_literal: true

require "grpc"
require "xpring/util"
require "xpring/error"
require "xpring/signer"
require "org/xrpl/rpc/v1/get_account_info_pb"
require "org/xrpl/rpc/v1/get_transaction_pb"
require "org/xrpl/rpc/v1/account_pb"
require "org/xrpl/rpc/v1/submit_pb"
require "org/xrpl/rpc/v1/xrp_ledger_services_pb"
require "org/xrpl/rpc/v1/get_fee_pb"

module Xpring
  # Make GRPC network calls to XRP ledger
  class Client
    MAX_LEDGER_VERSION_OFFSET = 10
    X_ADDRESS_REQUIRED_MSG = "Please use the X-Address format. See: https://xrpaddress.info"
    private_constant :MAX_LEDGER_VERSION_OFFSET, :X_ADDRESS_REQUIRED_MSG

    attr_reader :grpc_url, :credentials

    # @param grpc_url [#to_s]
    # @param credentials TODO
    def initialize(grpc_url, credentials: :this_channel_is_insecure)
      @grpc_url = grpc_url.to_s
      @credentials = credentials
    end

    # @param address [#to_s] classic address
    # @return [Integer, nil]
    def balance_of(address)
      account_data(address.to_s)&.account_data
        &.balance&.value&.xrp_amount&.drops
    end

    # @param transaction [#to_s]
    # @return [Symbol, nil]
    def status_of(transaction)
      transaction_data(transaction.to_s)&.meta
        &.transaction_result&.result_type
    end

    # @param amount [#to_s]
    # @param to [#to_s]
    # @param from [Xpring::Wallet]
    # @raise [Xpring::Error]
    # @return [Org::Xrpl::Rpc::V1::SubmitTransactionResponse]
    def send_xrp(amount:, to:, from:)
      to = to.to_s

      raise Error.new(X_ADDRESS_REQUIRED_MSG) unless Util.valid_x_address?(to)

      classic_from_address = Util.decode(from.address)[:address]
      raise Error.new(X_ADDRESS_REQUIRED_MSG) unless classic_from_address

      classic_to_address = Util.decode(to)[:address]
      raise Error.new(X_ADDRESS_REQUIRED_MSG) unless classic_to_address

      account_data = account_data(classic_from_address)
      raise Error.new(X_ADDRESS_REQUIRED_MSG) if account_data.nil?

      transaction_hash = {
        Account: classic_from_address,
        Fee: minimum_fee.to_s, # ripple-binary-codec requires string
        LastLedgerSequence: next_sequence_for_transaction,
        Sequence: account_data.account_data.sequence.value,
        SigningPubKey: from.public_key,
        Amount: amount.to_s, # ripple-binary-codec requires string
        Destination: classic_to_address,
        TransactionType: "Payment",
      }

      client.submit_transaction(Org::Xrpl::Rpc::V1::SubmitTransactionRequest.new(
        signed_transaction: Signer.sign(
          transaction_hash: transaction_hash,
          from_wallet: from,
        ),
      ))
    end

    private

    def client
      @client ||= Org::Xrpl::Rpc::V1::XRPLedgerAPIService::Stub.new(
        grpc_url,
        credentials,
      )
    end

    def fee_response
      client.get_fee(Org::Xrpl::Rpc::V1::GetFeeRequest.new)
    end

    def minimum_fee
      fee_response.fee.minimum_fee.drops
    end

    def account_data(address)
      client.get_account_info(Org::Xrpl::Rpc::V1::GetAccountInfoRequest.new(
        account: Org::Xrpl::Rpc::V1::AccountAddress.new(
          address: address,
        ),
      ))
    rescue GRPC::NotFound
    end

    def transaction_data(transaction)
      client.get_transaction(Org::Xrpl::Rpc::V1::GetTransactionRequest.new(
        hash: Util.byte_string_from_string(transaction),
      ))
    rescue GRPC::NotFound
    end

    def last_validated_ledger_sequence
      fee_response.ledger_current_index
    end

    def next_sequence_for_transaction
      last_validated_ledger_sequence + MAX_LEDGER_VERSION_OFFSET
    end
  end
end
