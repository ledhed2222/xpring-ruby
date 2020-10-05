# frozen_string_literal: true

RSpec.describe Xpring::Wallet do
  let(:mnemonic) { "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about" }
  let(:wallet) { Xpring::Wallet.from_mnemonic(mnemonic) }

  describe "::from_mnemonic" do
    context "given a valid mnemonic" do
      let(:mnemonic) { "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about" }

      it "returns a wallet" do
        expect(Xpring::Wallet.from_mnemonic(mnemonic).class).to eq(Xpring::Wallet)
      end
    end

    context "given an invalid mnemonic" do
      let(:mnemonic) { "" }

      it "raises" do
        expect do
          Xpring::Wallet.from_mnemonic(mnemonic)
        end.to raise_error(Xpring::Error)
      end
    end
  end

  describe "::from_seed" do
    context "given a valid seed" do
      let(:seed) { "snRiAJGeKCkPVddbjB3zRwiYDBm1M" }

      it "returns a wallet" do
        expect(Xpring::Wallet.from_seed(seed).class).to eq(Xpring::Wallet)
      end
    end

    context "given an invalid seed" do
      let(:seed) { "" }

      it "raises" do
        expect do
          Xpring::Wallet.from_seed(seed)
        end.to raise_error(Xpring::Error)
      end
    end
  end

  describe "#public_key" do
    it "returns a String" do
      expect(wallet.public_key.class).to eq(String)
    end
  end

  describe "#private_key" do
    it "returns a String" do
      expect(wallet.private_key.class).to eq(String)
    end
  end

  describe "#address" do
    it "returns a String" do
      expect(wallet.address.class).to eq(String)
    end
  end
end
