# frozen_string_literal: true

RSpec.describe Xpring do
  it "has a version number" do
    expect(Xpring::VERSION).to be_a(String)
  end

  describe "::debug?" do
    it "returns a boolean" do
      expect(Xpring.debug?).to eq(true).or eq(false)
    end
  end

  describe "::toggle_debug!" do
    it "changes the value of ::debug" do
      prior = Xpring.debug?
      expect do
        Xpring.toggle_debug!
      end.to change { Xpring.debug? }.to(!prior)
    end
  end

  describe "::debug_log" do
    let(:message) { "yo" }

    context "when ::debug? is true" do
      before(:each) do
        Xpring.toggle_debug! unless Xpring.debug?
      end

      it "prints to STDOUT" do
        expect do
          Xpring.debug_log(message)
        end.to output(message).to_stdout
      end
    end

    context "when ::debug? is false" do
      before(:each) do
        Xpring.toggle_debug! if Xpring.debug?
      end

      it "does not print to STDOUT" do
        expect do
          Xpring.debug_log(message)
        end.to_not output.to_stdout
      end
    end
  end
end
