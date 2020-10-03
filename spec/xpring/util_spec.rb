# frozen_string_literal: true

RSpec.describe Xpring::Util do
  let(:classic_address) { "rnysDDrRXxz9z66DmCmfWpq4Z5s4TyUP3G" }
  let(:x_address) { "X7jjQ4d6bz1qmjwxYUsw6gtxSyjYv5iWPqPEjGqqhn9Woti" }
  let(:bitcoin_address) { "1DiqLtKZZviDxccRpowkhVowsbLSNQWBE8" }

  describe "::valid_address?" do
    it "returns true for a classic address" do
      expect(Xpring::Util.valid_address?(classic_address)).to equal(true)
    end

    it "returns true for an x address" do
      expect(Xpring::Util.valid_address?(x_address)).to equal(true)
    end

    it "returns false for an invalid address" do
      expect(Xpring::Util.valid_address?(bitcoin_address)).to equal(false)
    end
  end

  describe "::valid_x_address?" do
    it "returns false for a classic address" do
      expect(Xpring::Util.valid_x_address?(classic_address)).to equal(false)
    end

    it "returns true for an x address" do
      expect(Xpring::Util.valid_x_address?(x_address)).to equal(true)
    end

    it "returns false for an invalid address" do
      expect(Xpring::Util.valid_x_address?(bitcoin_address)).to equal(false)
    end
  end

  describe "::valid_classic_address?" do
    it "returns true for a classic address" do
      expect(Xpring::Util.valid_classic_address?(classic_address)).to equal(true)
    end

    it "returns false for an x address" do
      expect(Xpring::Util.valid_classic_address?(x_address)).to equal(false)
    end

    it "returns false for an invalid address" do
      expect(Xpring::Util.valid_classic_address?(bitcoin_address)).to equal(false)
    end
  end
end
