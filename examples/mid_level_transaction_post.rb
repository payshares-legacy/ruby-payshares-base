#!/usr/bin/env ruby

# This is an example of using the higher level "payment" wrapper. Notice
# that we are using KeyPair instead of the raw rbnacl keys and that we need
# not build the entire heirarchy of xdr object manually.
#
# You can see where these helpers are defined in the files underneath /lib,
# which is where we extend the xdrgen generated source files with our higher
# level api.

require 'payshares-base'
require 'faraday'
require 'faraday_middleware'

$server = Faraday.new(url: "http://localhost:39132") do |conn|
  conn.response :json
  conn.adapter Faraday.default_adapter
end

master      = Payshares::KeyPair.from_raw_seed("allmylifemyhearthasbeensearching")
destination = Payshares::KeyPair.from_raw_seed("allmylifemyhearthasbeensearching")

tx = Payshares::Transaction.payment({
  account:     master,
  destination: destination,
  sequence:    1,
  amount:      [:native, 20_000000]
})

hex    = tx.to_envelope(master).to_xdr(:hex)

result = $server.get('tx', blob: hex)
raw    = [result.body["result"]].pack("H*")
p Payshares::TransactionResult.from_xdr(raw)