# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: org/xrpl/rpc/v1/common.proto

require 'google/protobuf'

require 'org/xrpl/rpc/v1/amount_pb'
require 'org/xrpl/rpc/v1/account_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("org/xrpl/rpc/v1/common.proto", :syntax => :proto3) do
    add_message "org.xrpl.rpc.v1.CancelAfter" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.ClearFlag" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.CloseTime" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.Date" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.DestinationTag" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.Expiration" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.FinishAfter" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.Flags" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.HighQualityIn" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.HighQualityOut" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.LastLedgerSequence" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.LowQualityIn" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.LowQualityOut" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.OfferSequence" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.OwnerCount" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.PreviousTransactionLedgerSequence" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.QualityIn" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.QualityOut" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.ReferenceFeeUnits" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.ReserveBase" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.ReserveIncrement" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.Sequence" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.SetFlag" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.SettleDelay" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.SignerListID" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.SignerQuorum" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.SignerWeight" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.SourceTag" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.TickSize" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.TransferRate" do
      optional :value, :uint32, 1
    end
    add_message "org.xrpl.rpc.v1.BaseFee" do
      optional :value, :uint64, 1
    end
    add_message "org.xrpl.rpc.v1.BookNode" do
      optional :value, :uint64, 1
    end
    add_message "org.xrpl.rpc.v1.DestinationNode" do
      optional :value, :uint64, 1
    end
    add_message "org.xrpl.rpc.v1.HighNode" do
      optional :value, :uint64, 1
    end
    add_message "org.xrpl.rpc.v1.IndexNext" do
      optional :value, :uint64, 1
    end
    add_message "org.xrpl.rpc.v1.IndexPrevious" do
      optional :value, :uint64, 1
    end
    add_message "org.xrpl.rpc.v1.LowNode" do
      optional :value, :uint64, 1
    end
    add_message "org.xrpl.rpc.v1.OwnerNode" do
      optional :value, :uint64, 1
    end
    add_message "org.xrpl.rpc.v1.EmailHash" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.TakerGetsIssuer" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.TakerPaysIssuer" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.AccountTransactionID" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.BookDirectory" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.Channel" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.CheckID" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.Hash" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.Index" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.InvoiceID" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.PreviousTransactionID" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.RootIndex" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.Condition" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.Fulfillment" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.MemoData" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.MemoFormat" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.MemoType" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.MessageKey" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.PublicKey" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.PaymentChannelSignature" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.SigningPublicKey" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.TransactionSignature" do
      optional :value, :bytes, 1
    end
    add_message "org.xrpl.rpc.v1.TakerGetsCurreny" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.Currency"
    end
    add_message "org.xrpl.rpc.v1.TakerPaysCurrency" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.Currency"
    end
    add_message "org.xrpl.rpc.v1.Amount" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.Balance" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.DeliverMin" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.DeliveredAmount" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.HighLimit" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.LimitAmount" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.LowLimit" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.SendMax" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.TakerGets" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.TakerPays" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.CurrencyAmount"
    end
    add_message "org.xrpl.rpc.v1.Account" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.AccountAddress"
    end
    add_message "org.xrpl.rpc.v1.Authorize" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.AccountAddress"
    end
    add_message "org.xrpl.rpc.v1.Destination" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.AccountAddress"
    end
    add_message "org.xrpl.rpc.v1.Owner" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.AccountAddress"
    end
    add_message "org.xrpl.rpc.v1.RegularKey" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.AccountAddress"
    end
    add_message "org.xrpl.rpc.v1.Unauthorize" do
      optional :value, :message, 1, "org.xrpl.rpc.v1.AccountAddress"
    end
    add_message "org.xrpl.rpc.v1.Domain" do
      optional :value, :string, 1
    end
    add_message "org.xrpl.rpc.v1.SignerEntry" do
      optional :account, :message, 1, "org.xrpl.rpc.v1.Account"
      optional :signer_weight, :message, 2, "org.xrpl.rpc.v1.SignerWeight"
    end
  end
end

module Org
  module Xrpl
    module Rpc
      module V1
        CancelAfter = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.CancelAfter").msgclass
        ClearFlag = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.ClearFlag").msgclass
        CloseTime = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.CloseTime").msgclass
        Date = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Date").msgclass
        DestinationTag = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.DestinationTag").msgclass
        Expiration = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Expiration").msgclass
        FinishAfter = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.FinishAfter").msgclass
        Flags = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Flags").msgclass
        HighQualityIn = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.HighQualityIn").msgclass
        HighQualityOut = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.HighQualityOut").msgclass
        LastLedgerSequence = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.LastLedgerSequence").msgclass
        LowQualityIn = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.LowQualityIn").msgclass
        LowQualityOut = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.LowQualityOut").msgclass
        OfferSequence = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.OfferSequence").msgclass
        OwnerCount = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.OwnerCount").msgclass
        PreviousTransactionLedgerSequence = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.PreviousTransactionLedgerSequence").msgclass
        QualityIn = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.QualityIn").msgclass
        QualityOut = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.QualityOut").msgclass
        ReferenceFeeUnits = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.ReferenceFeeUnits").msgclass
        ReserveBase = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.ReserveBase").msgclass
        ReserveIncrement = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.ReserveIncrement").msgclass
        Sequence = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Sequence").msgclass
        SetFlag = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SetFlag").msgclass
        SettleDelay = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SettleDelay").msgclass
        SignerListID = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SignerListID").msgclass
        SignerQuorum = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SignerQuorum").msgclass
        SignerWeight = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SignerWeight").msgclass
        SourceTag = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SourceTag").msgclass
        TickSize = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.TickSize").msgclass
        TransferRate = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.TransferRate").msgclass
        BaseFee = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.BaseFee").msgclass
        BookNode = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.BookNode").msgclass
        DestinationNode = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.DestinationNode").msgclass
        HighNode = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.HighNode").msgclass
        IndexNext = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.IndexNext").msgclass
        IndexPrevious = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.IndexPrevious").msgclass
        LowNode = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.LowNode").msgclass
        OwnerNode = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.OwnerNode").msgclass
        EmailHash = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.EmailHash").msgclass
        TakerGetsIssuer = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.TakerGetsIssuer").msgclass
        TakerPaysIssuer = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.TakerPaysIssuer").msgclass
        AccountTransactionID = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.AccountTransactionID").msgclass
        BookDirectory = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.BookDirectory").msgclass
        Channel = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Channel").msgclass
        CheckID = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.CheckID").msgclass
        Hash = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Hash").msgclass
        Index = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Index").msgclass
        InvoiceID = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.InvoiceID").msgclass
        PreviousTransactionID = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.PreviousTransactionID").msgclass
        RootIndex = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.RootIndex").msgclass
        Condition = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Condition").msgclass
        Fulfillment = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Fulfillment").msgclass
        MemoData = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.MemoData").msgclass
        MemoFormat = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.MemoFormat").msgclass
        MemoType = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.MemoType").msgclass
        MessageKey = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.MessageKey").msgclass
        PublicKey = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.PublicKey").msgclass
        PaymentChannelSignature = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.PaymentChannelSignature").msgclass
        SigningPublicKey = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SigningPublicKey").msgclass
        TransactionSignature = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.TransactionSignature").msgclass
        TakerGetsCurreny = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.TakerGetsCurreny").msgclass
        TakerPaysCurrency = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.TakerPaysCurrency").msgclass
        Amount = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Amount").msgclass
        Balance = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Balance").msgclass
        DeliverMin = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.DeliverMin").msgclass
        DeliveredAmount = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.DeliveredAmount").msgclass
        HighLimit = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.HighLimit").msgclass
        LimitAmount = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.LimitAmount").msgclass
        LowLimit = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.LowLimit").msgclass
        SendMax = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SendMax").msgclass
        TakerGets = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.TakerGets").msgclass
        TakerPays = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.TakerPays").msgclass
        Account = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Account").msgclass
        Authorize = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Authorize").msgclass
        Destination = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Destination").msgclass
        Owner = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Owner").msgclass
        RegularKey = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.RegularKey").msgclass
        Unauthorize = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Unauthorize").msgclass
        Domain = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.Domain").msgclass
        SignerEntry = Google::Protobuf::DescriptorPool.generated_pool.lookup("org.xrpl.rpc.v1.SignerEntry").msgclass
      end
    end
  end
end