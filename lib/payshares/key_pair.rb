module Payshares
  class KeyPair
    def self.from_seed(seed)
      seed_bytes = Util::Base58.payshares.check_decode(:seed, seed)
      from_raw_seed seed_bytes
    end

    def self.from_raw_seed(seed_bytes)
      secret_key = RbNaCl::SigningKey.new(seed_bytes)
      public_key = secret_key.verify_key
      new(public_key, secret_key)
    end

    def self.from_public_key(pk_bytes)
      public_key = RbNaCl::VerifyKey.new(pk_bytes)
      new(public_key)
    end

    def self.from_address(address)
      pk_bytes = Util::Base58.payshares.check_decode(:account_id, address)
      from_public_key(pk_bytes)
    end

    def self.random
      secret_key = RbNaCl::SigningKey.generate
      public_key = secret_key.verify_key
      new(public_key, secret_key)
    end

    def initialize(public_key, secret_key=nil)
      @public_key = public_key
      @secret_key = secret_key
    end

    def public_key
      @public_key.to_bytes
    end

    def public_key_hint
      public_key.slice(0, 4)
    end

    def raw_seed
      @secret_key.to_bytes
    end

    def rbnacl_signing_key
      @secret_key
    end

    def rbnacl_verify_key
      @public_key
    end

    def address
      pk_bytes = public_key
      Util::Base58.payshares.check_encode(:account_id, pk_bytes)
    end

    def seed
      raise "no private key" if @secret_key.nil?
      #TODO: improve the error class above
      seed_bytes = raw_seed
      encoder = Util::Base58.payshares.check_encode(:seed, seed_bytes)
    end

    def sign?
      !@secret_key.nil?
    end

    def sign(message)
      raise "no private key" if @secret_key.nil?
      #TODO: improve the error class above
      @secret_key.sign(message)
    end

    def sign_decorated(message)
      raw_signature = sign(message)
      Payshares::DecoratedSignature.new({
        hint:      public_key_hint,
        signature: raw_signature
      })
    end

    def verify(signature, message)
      @public_key.verify(signature, message)
    rescue RbNaCl::LengthError
      false
    rescue RbNaCl::BadSignatureError
      false
    end

  end
end