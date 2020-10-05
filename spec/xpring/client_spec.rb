# frozen_string_literal: true

RSpec.describe Xpring::Client do
  # not ideal - at the moment this relies on external balances on xrp testnet,
  # which can be reset at anytime. these tests are therefore far too brittle.
  let(:grpc_url) { "test.xrp.xpring.io:50051" }
  let(:client) { Xpring::Client.new(grpc_url) }

  describe "#status_of" do
    let(:transaction) { "6EBE44B145624D72373999BA9F4B82DDE9540136974DAE158451CB9177FC2CA8" }

    it "returns the expected status" do
      expect(client.status_of(transaction)).to eq(:RESULT_TYPE_TEC)
    end

    context "with invalid input" do
      let(:transaction) { "garbage" }

      it "raises GRPC::InvalidArgument" do
        expect do
          client.status_of(transaction)
        end.to raise_error(GRPC::InvalidArgument)
      end
    end

    context "with non-existant input" do
      let(:transaction) { "9FC7D277C1C8ED9CE133CC17AEA9978E71FC644CE6F5F0C8E26F1C635D97AF4A" }

      it "returns nil" do
        expect(client.status_of(transaction)).to eq(nil)
      end
    end
  end

  describe "#balance_of" do
    let(:xrp_address) { "rUqLTchwqdda2T9QsRR1UA3rxx1euMjeA6" }

    it "returns an int" do
      expect(client.balance_of(xrp_address).class).to eq(Integer)
    end

    context "with invalid input" do
      let(:xrp_address) { "garbage" }

      it "returns nil" do
        expect(client.balance_of(xrp_address)).to eq(nil)
      end
    end
  end

  describe "#send_xrp" do
    let(:amount) { 1 }
    let(:sender_seed) { "snRqtKrpttPgVaRNkbLc3wqQib5yu" }
    let(:sender_wallet) { Xpring::Wallet.from_seed(sender_seed) }
    let(:receiver_seed) { "snRiAJGeKCkPVddbjB3zRwiYDBm1M" }
    let(:receiver_wallet) { Xpring::Wallet.from_seed(receiver_seed) }

    it "returns an Org::Xrpl::Rpc::V1::SubmitTransactionResponse" do
      expect(client.send_xrp(
        amount: amount,
        to: receiver_wallet.address,
        from: sender_wallet,
      ).class).to eq(Org::Xrpl::Rpc::V1::SubmitTransactionResponse)
    end

    xit "returns an OK status" do
      expect(client.send_xrp(
        amount: amount,
        to: receiver_wallet.address,
        from: sender_wallet,
      ).engine_result.result_type).to eq(:RESULT_TYPE_TES)
    end
  end
end
