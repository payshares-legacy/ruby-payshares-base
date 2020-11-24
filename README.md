# Payshares::Base

[![Build Status](https://travis-ci.org/payshares/ruby-payshares-base.svg)](https://travis-ci.org/payshares/ruby-payshares-base)

The payshares-base library is the lowest-level payshares helper library.  It consists of classes
to read, write, hash, and sign the xdr structures that are used in paysharesd.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'payshares-base'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install payshares-base

Also requires libsodium. Installable via `brew install libsodium` on OS X.

## Usage

[Examples are here](examples)

In addition to the code generated from the XDR definition files (see [ruby-xdr](https://github.com/payshares/ruby-xdr) for example usage), this library also provides some payshares specific features.  Let's look at some of them.

We wrap rbnacl with `Payshares::KeyPair`, providing some payshares specific functionality as seen below:

```ruby

# Create a keypair from a payshares secret seed
signer = Payshares::KeyPair.from_seed("s3QkY97wSa5KTE5zdUHKk7aoyM5Bm1ySzV7bgkCdRLpGK7ptRu6")

# Create a keypair from a payshares address
verifier = Payshares::KeyPair.from_address("s3QkY97wSa5KTE5zdUHKk7aoyM5Bm1ySzV7bgkCdRLpGK7ptRu6")

# Produce a payshares compliant "decorated signature" that is compliant with payshares transactions

signer.sign_decorated("Hello world!") # => #<Payshares::DecoratedSignature ...>

```

This library also provides an impementation of base58 and base58check encoding, with support for the bitcoin and payshares alphabets:

```ruby
b58 = Payshares::Util::Base58.payshares

encoded = b58.encode("\x00\x00\x00") # => "ggg"
b58.decode(encoded) # => "\x00\x00\x00"

# we can also use check encoding

b58.check_encode(:account_id, "\x00\x00\x00") # => "gggghbdQd2"
b58.check_encode(:seed, "\x00\x00\x00") # => "aX9UTew55Eh"

# To prevent interpretation mistakes, you must pass the expected version byte
# when decoding a check_encoded value

encoded = b58.check_encode(:account_id, "\x00\x00\x00")
b58.check_decode(:account_id, encoded) # => "\x00\x00\x00"
b58.check_decode(:seed, encoded) # => throws ArgumentError: Unexpected version: :account_id

```

## Caveats

The current integration of user-written code with auto-generated classes is to put it nicely, weird.  We intend to segregate the auto-generated code into its own namespace and refrain from monkey patching them.  This will happen before 1.0, and hopefully will happen soon.

## Contributing

Please [see CONTRIBUTING.md for details](CONTRIBUTING.md).

