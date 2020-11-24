# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct PaysharesBallotValue
#   {
#       Hash txSetHash;
#       uint64 closeTime;
#       uint32 baseFee;
#   };
#
# ===========================================================================
module Payshares
  class PaysharesBallotValue < XDR::Struct
    attribute :tx_set_hash, Hash
    attribute :close_time,  Uint64
    attribute :base_fee,    Uint32
  end
end
