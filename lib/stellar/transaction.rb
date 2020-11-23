module Payshares
  Transaction.class_eval do

    # 
    # @see  Payshares::Operation.payment
    def self.payment(attributes={})
      make :payment, attributes
    end

    # 
    # @see  Payshares::Operation.change_trust
    def self.change_trust(attributes={})
      make :change_trust, attributes
    end

    # 
    # @see  Payshares::Operation.create_offer
    def self.create_offer(attributes={})
      make :create_offer, attributes
    end

    # 
    # Helper method to create a transaction with a single
    # operation of the provided type.  See class methods
    # on Payshares::Operation for available values for 
    # operation_type.
    # 
    # @see  Payshares::Operation
    # 
    # @param operation_type [Symbol] the operation to use
    # @param attributes={} [Hash] attributes to use for both the transaction and the operation
    # 
    # @return [Payshares::Transaction] the resulting transaction
    def self.make(operation_type, attributes={})
      for_account(attributes).tap do |result|
        result.operations = [Operation.send(operation_type, attributes)]
      end
    end


    # 
    # Helper method to create the skeleton of a transaction.  
    # The resulting transaction will have its source account,
    # sequence, fee, min ledger and max ledger set.  
    # 
    # 
    # @param attributes={} [type] [description]
    # 
    # @return [Payshares::Transaction] the resulting skeleton
    def self.for_account(attributes={})
      account  = attributes[:account]
      sequence = attributes[:sequence]
      max_fee  = attributes[:max_fee]
      
      raise ArgumentError, "Bad :account" unless account.is_a?(KeyPair) && account.sign?
      raise ArgumentError, "Bad :sequence #{sequence}" unless sequence.is_a?(Integer)
      raise ArgumentError, "Bad :max_fee #{sequence}" if max_fee.present? && !max_fee.is_a?(Integer)

      new.tap do |result|
        result.seq_num  = sequence
        result.max_fee  = max_fee
        result.source_account  = account.public_key
        result.apply_defaults
      end
    end

    def sign(key_pair)
      key_pair.sign(hash)
    end

    def sign_decorated(key_pair)
      key_pair.sign_decorated(hash)
    end

    def hash
      Digest::SHA256.digest(to_xdr)
    end

    def to_envelope(*key_pairs)
      signatures = key_pairs.map(&method(:sign_decorated))
      
      TransactionEnvelope.new({
        :signatures => signatures,
        :tx => self
      })
    end

    def apply_defaults
      self.max_fee    ||= 10
      self.min_ledger ||= 0
      self.max_ledger ||= 2**32 - 1
    end
  end
end