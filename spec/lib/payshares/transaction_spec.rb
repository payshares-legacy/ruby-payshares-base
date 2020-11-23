require "spec_helper"

describe Payshares::Transaction do
  subject do
    Payshares::Transaction.new({
      source_account: "\x00" * 32,
      max_fee:        10,
      seq_num:        1,
      max_ledger:     10,
      min_ledger:     0,
      operations:     [
        Payshares::Operation.new(body: Payshares::Operation::Body.new(:inflation, 1))
      ]
    })
  end
  let(:key_pair){ Payshares::KeyPair.random }
  
  describe "#sign" do
    let(:result){ subject.sign(key_pair) }

    it "returns a signature of SHA256(xdr form of the transaction)" do
      xdr      = subject.to_xdr
      hash     = Digest::SHA256.digest(xdr)
      expected = key_pair.sign(hash)
      expect(result).to eq(expected)
    end
  end

  describe  "#to_envelope" do
    let(:result){ subject.to_envelope(key_pair) }

    it "return a Payshares::TransactionEnvelope" do
      expect(result).to be_a(Payshares::TransactionEnvelope)
    end

    it "correctly signs the transaction" do
      expect(result.signatures.length).to eq(1)
      expect(result.signatures.first).to be_a(Payshares::DecoratedSignature)
      expect(result.signatures.first.hint).to eq(key_pair.public_key_hint)
      expect(result.signatures.first.signature).to eq(subject.sign(key_pair))
    end
  end
end
