# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: org/xrpl/rpc/v1/ledger_objects.proto

require 'google/protobuf'

require 'org/xrpl/rpc/v1/common_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("org/xrpl/rpc/v1/ledger_objects.proto", :syntax => :proto3) do
    add_message "org.xrpl.rpc.v1.LedgerObject" do
      oneof :object do
        optional :account_root, :message, 1, "org.xrpl.rpc.v1.AccountRoot"
        optional :amendments, :message, 2, "org.xrpl.rpc.v1.Amendments"
        optional :check, :message, 3, "org.xrpl.rpc.v1.Check"
        optional :deposit_preauth, :message, 4, "org.xrpl.rpc.v1.DepositPreauthObject"
        optional :directory_node, :message, 5, "org.xrpl.rpc.v1.DirectoryNode"
        optional :escrow, :message, 6, "org.xrpl.rpc.v1.Escrow"
        optional :fee_settings, :message, 7, "org.xrpl.rpc.v1.FeeSettings"
        optional :ledger_hashes, :message, 8, "org.xrpl.rpc.v1.LedgerHashes"
        optional :offer, :message, 9, "org.xrpl.rpc.v1.Offer"
        optional :pay_channel, :message, 10, "org.xrpl.rpc.v1.PayChannel"
        optional :ripple_state, :message, 11, "org.xrpl.rpc.v1.RippleState"
        optional :signer_list, :message, 12, "org.xrpl.rpc.v1.SignerList"
      end
    end
    add_message "org.xrpl.rpc.v1.AccountRoot" do
      optional :account, :message, 1, "org.xrpl.rpc.v1.Account"
      optional :balance, :message, 2, "org.xrpl.rpc.v1.Balance"
      optional :sequence, :message, 3, "org.xrpl.rpc.v1.Sequence"
      optional :flags, :message, 4, "org.xrpl.rpc.v1.Flags"
      optional :owner_count, :message, 5, "org.xrpl.rpc.v1.OwnerCount"
      optional :previous_transaction_id, :message, 6, "org.xrpl.rpc.v1.PreviousTransactionID"
      optional :previous_transaction_ledger_sequence, :message, 7, "org.xrpl.rpc.v1.PreviousTransactionLedgerSequence"
      optional :account_transaction_id, :message, 8, "org.xrpl.rpc.v1.AccountTransactionID"
      optional :domain, :message, 9, "org.xrpl.rpc.v1.Domain"
      optional :email_hash, :message, 10, "org.xrpl.rpc.v1.EmailHash"
      optional :message_key, :message, 11, "org.xrpl.rpc.v1.MessageKey"
      optional :regular_key, :message, 12, "org.xrpl.rpc.v1.RegularKey"
      optional :tick_size, :message, 13, "org.xrpl.rpc.v1.TickSize"
      optional :transfer_rate, :message, 14, "org.xrpl.rpc.v1.TransferRate"
    end
    add_message "org.xrpl.rpc.v1.Amendments" do
      repeated :amendments, :message, 1, "org.xrpl.rpc.v1.Amendments.Amendment"
      repeated :majorities, :message, 2, "org.xrpl.rpc.v1.Amendments.Majority"
      optional :flags, :message, 3, "org.xrpl.rpc.v1.Flags"
    end
    add_message "org.xrpl.rpc.v1.Amendments.Amendment" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.Amendments.Majority" do
      optional :amendment, :message, 1, "org.xrpl.rpc.v1.Amendments.Amendment"
      optional :close_time, :message, 2, "org.xrpl.rpc.v1.CloseTime"
    end
    add_message "org.xrpl.rpc.v1.Check" do
      optional :account, :message, 1, "org.xrpl.rpc.v1.Account"
      optional :destination, :message, 2, "org.xrpl.rpc.v1.Destination"
      optional :flags, :message, 3, "org.xrpl.rpc.v1.Flags"
      optional :owner_node, :message, 4, "org.xrpl.rpc.v1.OwnerNode"
      optional :previous_transaction_id, :message, 5, "org.xrpl.rpc.v1.PreviousTransactionID"
      optional :previous_transaction_ledger_sequence, :message, 6, "org.xrpl.rpc.v1.PreviousTransactionLedgerSequence"
      optional :send_max, :message, 7, "org.xrpl.rpc.v1.SendMax"
      optional :sequence, :message, 8, "org.xrpl.rpc.v1.Sequence"
      optional :destination_node, :message, 9, "org.xrpl.rpc.v1.DestinationNode"
      optional :destination_tag, :message, 10, "org.xrpl.rpc.v1.DestinationTag"
      optional :expiration, :message, 11, "org.xrpl.rpc.v1.Expiration"
      optional :invoice_id, :message, 12, "org.xrpl.rpc.v1.InvoiceID"
      optional :source_tag, :message, 13, "org.xrpl.rpc.v1.SourceTag"
    end
    add_message "org.xrpl.rpc.v1.DepositPreauthObject" do
      optional :account, :message, 1, "org.xrpl.rpc.v1.Account"
      optional :authorize, :message, 2, "org.xrpl.rpc.v1.Authorize"
      optional :flags, :message, 3, "org.xrpl.rpc.v1.Flags"
      optional :owner_node, :message, 4, "org.xrpl.rpc.v1.OwnerNode"
      optional :previous_transaction_id, :message, 5, "org.xrpl.rpc.v1.PreviousTransactionID"
      optional :previous_transaction_ledger_sequence, :message, 6, "org.xrpl.rpc.v1.PreviousTransactionLedgerSequence"
    end
    add_message "org.xrpl.rpc.v1.DirectoryNode" do
      optional :flags, :message, 1, "org.xrpl.rpc.v1.Flags"
      optional :root_index, :message, 2, "org.xrpl.rpc.v1.RootIndex"
      repeated :indexes, :message, 3, "org.xrpl.rpc.v1.Index"
      optional :index_next, :message, 4, "org.xrpl.rpc.v1.IndexNext"
      optional :index_previous, :message, 5, "org.xrpl.rpc.v1.IndexPrevious"
      optional :owner, :message, 6, "org.xrpl.rpc.v1.Owner"
      optional :taker_pays_currency, :message, 7, "org.xrpl.rpc.v1.TakerPaysCurrency"
      optional :taker_pays_issuer, :message, 8, "org.xrpl.rpc.v1.TakerPaysIssuer"
      optional :taker_gets_currency, :message, 9, "org.xrpl.rpc.v1.TakerGetsCurreny"
      optional :taker_gets_issuer, :message, 10, "org.xrpl.rpc.v1.TakerGetsIssuer"
    end
    add_message "org.xrpl.rpc.v1.Escrow" do
      optional :account, :message, 1, "org.xrpl.rpc.v1.Account"
      optional :destination, :message, 2, "org.xrpl.rpc.v1.Destination"
      optional :amount, :message, 3, "org.xrpl.rpc.v1.Amount"
      optional :condition, :message, 4, "org.xrpl.rpc.v1.Condition"
      optional :cancel_after, :message, 5, "org.xrpl.rpc.v1.CancelAfter"
      optional :finish_after, :message, 6, "org.xrpl.rpc.v1.FinishAfter"
      optional :flags, :message, 7, "org.xrpl.rpc.v1.Flags"
      optional :source_tag, :message, 8, "org.xrpl.rpc.v1.SourceTag"
      optional :destination_tag, :message, 9, "org.xrpl.rpc.v1.DestinationTag"
      optional :owner_node, :message, 10, "org.xrpl.rpc.v1.OwnerNode"
      optional :destination_node, :message, 11, "org.xrpl.rpc.v1.DestinationNode"
      optional :previous_transaction_id, :message, 12, "org.xrpl.rpc.v1.PreviousTransactionID"
      optional :previous_transaction_ledger_sequence, :message, 13, "org.xrpl.rpc.v1.PreviousTransactionLedgerSequence"
    end
    add_message "org.xrpl.rpc.v1.FeeSettings" do
      optional :base_fee, :message, 1, "org.xrpl.rpc.v1.BaseFee"
      optional :reference_fee_units, :message, 2, "org.xrpl.rpc.v1.ReferenceFeeUnits"
      optional :reserve_base, :message, 3, "org.xrpl.rpc.v1.ReserveBase"
      optional :reserve_increment, :message, 4, "org.xrpl.rpc.v1.ReserveIncrement"
      optional :flags, :message, 5, "org.xrpl.rpc.v1.Flags"
    end
    add_message "org.xrpl.rpc.v1.LedgerHashes" do
      optional :last_ledger_sequence, :message, 1, "org.xrpl.rpc.v1.LastLedgerSequence"
      repeated :hashes, :message, 2, "org.xrpl.rpc.v1.Hash"
      optional :flags, :message, 3, "org.xrpl.rpc.v1.Flags"
    end
    add_message "org.xrpl.rpc.v1.Offer" do
      optional :account, :message, 1, "org.xrpl.rpc.v1.Account"
      optional :sequence, :message, 2, "org.xrpl.rpc.v1.Sequence"
      optional :flags, :message, 3, "org.xrpl.rpc.v1.Flags"
      optional :taker_pays, :message, 4, "org.xrpl.rpc.v1.TakerPays"
      optional :taker_gets, :message, 5, "org.xrpl.rpc.v1.TakerGets"
      optional :book_directory, :message, 6, "org.xrpl.rpc.v1.BookDirectory"
      optional :book_node, :message, 7, "org.xrpl.rpc.v1.BookNode"
      optional :owner_node, :message, 8, "org.xrpl.rpc.v1.OwnerNode"
      optional :expiration, :message, 9, "org.xrpl.rpc.v1.Expiration"
      optional :previous_transaction_id, :message, 10, "org.xrpl.rpc.v1.PreviousTransactionID"
      optional :previous_transaction_ledger_sequence, :message, 11, "org.xrpl.rpc.v1.PreviousTransactionLedgerSequence"
    end
    add_message "org.xrpl.rpc.v1.PayChannel" do
      optional :account, :message, 1, "org.xrpl.rpc.v1.Account"
      optional :destination, :message, 2, "org.xrpl.rpc.v1.Destination"
      optional :amount, :message, 3, "org.xrpl.rpc.v1.Amount"
      optional :balance, :message, 4, "org.xrpl.rpc.v1.Balance"
      optional :public_key, :message, 5, "org.xrpl.rpc.v1.PublicKey"
      optional :settle_delay, :message, 6, "org.xrpl.rpc.v1.SettleDelay"
      optional :owner_node, :message, 7, "org.xrpl.rpc.v1.OwnerNode"
      optional :previous_transaction_id, :message, 8, "org.xrpl.rpc.v1.PreviousTransactionID"
      optional :previous_transaction_ledger_sequence, :message, 9, "org.xrpl.rpc.v1.PreviousTransactionLedgerSequence"
      optional :flags, :message, 10, "org.xrpl.rpc.v1.Flags"
      optional :expiration, :message, 11, "org.xrpl.rpc.v1.Expiration"
      optional :cancel_after, :message, 12, "org.xrpl.rpc.v1.CancelAfter"
      optional :source_tag, :message, 13, "org.xrpl.rpc.v1.SourceTag"
      optional :destination_tag, :message, 14, "org.xrpl.rpc.v1.DestinationTag"
    end
    add_message "org.xrpl.rpc.v1.RippleState" do
      optional :balance, :message, 1, "org.xrpl.rpc.v1.Balance"
      optional :flags, :message, 2, "org.xrpl.rpc.v1.Flags"
      optional :low_limit, :message, 3, "org.xrpl.rpc.v1.LowLimit"
      optional :high_limit, :message, 4, "org.xrpl.rpc.v1.HighLimit"
      optional :low_node, :message, 5, "org.xrpl.rpc.v1.LowNode"
      optional :high_node, :message, 6, "org.xrpl.rpc.v1.HighNode"
      optional :low_quality_in, :message, 7, "org.xrpl.rpc.v1.LowQualityIn"
      optional :low_quality_out, :message, 8, "org.xrpl.rpc.v1.LowQualityOut"
      optional :high_quality_in, :message, 9, "org.xrpl.rpc.v1.HighQualityIn"
      optional :high_quality_out, :message, 10, "org.xrpl.rpc.v1.HighQualityOut"
      optional :previous_transaction_id, :message, 11, "org.xrpl.rpc.v1.PreviousTransactionID"
      optional :previous_transaction_ledger_sequence, :message, 12, "org.xrpl.rpc.v1.PreviousTransactionLedgerSequence"
    end
    add_message "org.xrpl.rpc.v1.SignerList" do
      optional :flags, :message, 1, "org.xrpl.rpc.v1.Flags"
      optional :previous_transaction_id, :message, 2, "org.xrpl.rpc.v1.PreviousTransactionID"
      optional :previous_transaction_ledger_sequence, :message, 3, "org.xrpl.rpc.v1.PreviousTransactionLedgerSequence"
      optional :owner_node, :message, 4, "org.xrpl.rpc.v1.OwnerNode"
      repeated :signer_entries, :message, 5, "org.xrpl.rpc.v1.SignerEntry"
      optional :signer_list_id, :message, 6, "org.xrpl.rpc.v1.SignerListID"
      optional :signer_quorum, :message, 7, "org.xrpl.rpc.v1.SignerQuorum"
    end
    add_enum "org.xrpl.rpc.v1.LedgerEntryType" do
      value :LEDGER_ENTRY_TYPE_UNSPECIFIED, 0
      value :LEDGER_ENTRY_TYPE_ACCOUNT_ROOT, 1
      value :LEDGER_ENTRY_TYPE_AMENDMENTS, 2
      value :LEDGER_ENTRY_TYPE_CHECK, 3
      value :LEDGER_ENTRY_TYPE_DEPOSIT_PREAUTH, 4
      value :LEDGER_ENTRY_TYPE_DIRECTORY_NODE, 5
      value :LEDGER_ENTRY_TYPE_ESCROW, 6
      value :LEDGER_ENTRY_TYPE_FEE_SETTINGS, 7
      value :LEDGER_ENTRY_TYPE_LEDGER_HASHES, 8
      value :LEDGER_ENTRY_TYPE_OFFER, 9
      value :LEDGER_ENTRY_TYPE_PAY_CHANNEL, 10
      value :LEDGER_ENTRY_TYPE_RIPPLE_STATE, 11
      value :LEDGER_ENTRY_TYPE_SIGNER_LIST, 12
    end
  end
end

module Org
  module Xrpl
    module Rpc
      module V1
        LedgerObject = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.LedgerObject").msgclass
        AccountRoot = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.AccountRoot").msgclass
        Amendments = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Amendments").msgclass
        Amendments::Amendment = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Amendments.Amendment").msgclass
        Amendments::Majority = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Amendments.Majority").msgclass
        Check = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Check").msgclass
        DepositPreauthObject = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.DepositPreauthObject").msgclass
        DirectoryNode = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.DirectoryNode").msgclass
        Escrow = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Escrow").msgclass
        FeeSettings = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.FeeSettings").msgclass
        LedgerHashes = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.LedgerHashes").msgclass
        Offer = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Offer").msgclass
        PayChannel = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.PayChannel").msgclass
        RippleState = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.RippleState").msgclass
        SignerList = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SignerList").msgclass
        LedgerEntryType = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.LedgerEntryType").enummodule
      end
    end
  end
end
