# frozen_string_literal: true

require "rpc/v1/amount_pb"
require "rpc/v1/account_info_pb"
require "rpc/v1/xrp_ledger_services_pb"
require "rpc/v1/tx_pb"
require "rpc/v1/fee_pb"
require "rpc/v1/transaction_pb"
require "payment_pb"
require "xpring/util"
require "xpring/error"
require "xpring/javascript"
require "grpc"

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

    # TODO: doesn't work
    def status_of(transaction)
      request = Rpc::V1::GetTxRequest.new(
        hash: Util.byte_string_from(transaction),
      )
      client.get_tx(request)
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

      xrp_drops_amount = Rpc::V1::XRPDropsAmount.new(
        drops: amount,
      )

      currency_amount = Rpc::V1::CurrencyAmount.new(
        xrp_amount: xrp_drops_amount,
      )

      destination = Rpc::V1::AccountAddress.new(
        address: to,
      )

      payment = Io::Xpring::Payment.new(
        destination: destination,
        amount: currency_amount,
      )

      account = Rpc::V1::AccountAddress.new(
        address: from.address,
      )

      transaction = Rpc::V1::Transaction.new(
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

      request = Rpc::V1::XPRLedgerAPIService::SubmitTransactionRequest.new(
        signed_transaction: signed_transaction,
      )

      client.submit_transaction(request)
    end

    private

    def client
      @client ||= Rpc::V1::XRPLedgerAPIService::Stub.new(
        grpc_url,
        credentials,
      )
    end

    def fee
      client.get_fee(Rpc::V1::GetFeeRequest.new)
    end

    def minimum_fee
      fee.drops.minimum_fee
    end

    def account_data(address)
      client.get_account_info(Rpc::V1::GetAccountInfoRequest.new(
        account: Rpc::V1::AccountAddress.new(address: address.to_s),
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

