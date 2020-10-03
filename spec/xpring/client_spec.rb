# frozen_string_literal: true

RSpec.describe Xpring::Client do
  let(:grpc_url) { "s.altnet.rippletest.net:51233" }
  let(:client) { Xpring::Client.new(grpc_url) }
  let(:address) { "X7u4MQVhU2YxS4P9fWzQjnNuDRUkP3GM6kiVjTjcQgUU3Jr" }
  let(:sender_mnemonic) { "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about" }
  let(:sender_wallet) { Xpring::Wallet.from_mnemonic(sender_mnemonic) }
  let(:receiver_seed) { "snRiAJGeKCkPVddbjB3zRwiYDBm1M" }
  let(:receiver_wallet) { Xpring::Wallet.from_seed(receiver_seed) }

  describe "#status_of" do
  end

  describe "#balance_of" do
    it "returns an int" do
      expect(client.balance_of(address).class).to equal(Integer)
    end
  end

  describe "#send_xrp" do
    let(:amount) { 10 }
    let(:destination) { "X7u4MQVhU2YxS4P9fWzQjnNuDRUkP3GM6kiVjTjcQgUU3Jr" }

    it "returns an Org::Xrpl::Rpc::V1::SubmitTransactionResponse" do
      expect(client.send_xrp(
        amount: amount,
        to: receiver_wallet.address,
        from: sender_wallet,
      ).class).to eq(Org::Xrpl::Rpc::V1::SubmitTransactionResponse)
    end

    it "returns an OK status" do
      expect(client.send_xrp(
        amount: amount,
        to: receiver_wallet.address,
        from: sender_wallet,
      ).engine_result.result_type).to eq(:RESULT_TYPE_TES)
    end
  end
end
