# frozen_string_literal: true

require "grpc"
require "xpring/util"
require "xpring/error"
require "xpring/javascript"
require "org/xrpl/rpc/v1/get_account_info_pb"
require "org/xrpl/rpc/v1/get_transaction_pb"
require "org/xrpl/rpc/v1/amount_pb"
require "org/xrpl/rpc/v1/account_pb"
require "org/xrpl/rpc/v1/transaction_pb"
require "org/xrpl/rpc/v1/submit_pb"
require "org/xrpl/rpc/v1/xrp_ledger_services_pb"
require "org/xrpl/rpc/v1/get_fee_pb"

module Xpring
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

    # @param address [#to_s]
    # @return [Integer, nil]
    def balance_of(address)
      account_data(address.to_s)&.account_data&.balance&.drops
    end

    # @param transaction [#to_s]
    # @return [Symbol, nil]
    # TODO - maybe transaction should be a class, should allow for returning
    # specific result and result type
    def status_of(transaction)
      transaction_data(transaction.to_s)&.meta&.transaction_result&.result_type
    end

    # @param amount [#to_i]
    # @param to [#to_s]
    # @param from [Xpring::Wallet]
    # @raise [Xpring::Error]
    # TODO: doesn't work
    def send_xrp(amount:, to:, from:)
      amount = amount.to_i
      to = to.to_s

      raise Error.new(X_ADDRESS_REQUIRED_MSG) if !Util.valid_x_address?(to)

      classic_address = Util.decode(from.address)
      raise Error.new(X_ADDRESS_REQUIRED_MSG) if !classic_address

      account_data = account_data(classic_address[:address])
      raise Error.new(X_ADDRESS_REQUIRED_MSG) if account_data.nil?

      xrp_drops_amount = Org::Xrpl::Rpc::V1::XRPDropsAmount.new(
        drops: amount,
      )

      currency_amount = Org::Xrpl::Rpc::V1::CurrencyAmount.new(
        xrp_amount: xrp_drops_amount,
      )

      destination = Org::Xrpl::Rpc::V1::AccountAddress.new(
        address: to,
      )

      payment = Org::Xrpl::Rpc::V1::Payment.new(
        destination: destination,
        amount: currency_amount,
      )

      account = Org::Xrpl::Rpc::V1::AccountAddress.new(
        address: from.address,
      )

      transaction = Org::Xrpl::Rpc::V1::Transaction.new(
        account: account,
        fee: minimum_fee,
        sequence: account_data.sequence,
        payment: payment,
        last_ledger_sequence: next_sequence_for_transaction,
      )

      signing_public_key_bytes = Util.byte_string_from(from.public_key)
      # TODO i think i should just re implement signing
      signed_transaction = Javascript.run do
        <<-JAVASCRIPT
        EntryPoint.Signer.signTransaction('''''
        JAVASCRIPT
      end

      request = Org::Xrpl::Rpc::V1::SubmitTransactionRequest.new(
        signed_transaction: signed_transaction,
      )

      client.submit_transaction(request)
    end

    private

    def client
      @client ||= Org::Xrpl::Rpc::V1::XRPLedgerAPIService::Stub.new(
        grpc_url,
        credentials,
      )
    end

    def fee
      client.get_fee(Org::Xrpl::Rpc::V1::GetFeeRequest.new)
    end

    def minimum_fee
      fee.drops.minimum_fee
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
        hash: Util.byte_string_from(transaction),
      ))
    rescue GRPC::NotFound
    end

    def last_validated_ledger_sequence
      fee.ledger_current_index
    end

    def next_sequence_for_transaction
      last_validated_ledger_sequence + MAX_LEDGER_VERSION_OFFSET
    end
  end
end

