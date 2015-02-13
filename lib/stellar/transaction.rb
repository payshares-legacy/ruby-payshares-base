module Stellar
  Transaction.class_eval do
    def sign(key_pair)
      key_pair.sign(to_xdr)
    end

    def to_envelope(*key_pairs)
      signatures = key_pairs.map(&method(:sign))
      
      TransactionEnvelope.new({
        :signatures => signatures,
        :tx => self
      })
    end
  end
end