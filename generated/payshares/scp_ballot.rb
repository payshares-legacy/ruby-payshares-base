# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct SCPBallot
#   {
#       uint32 counter; // n
#       Value value;    // x
#   };
#
# ===========================================================================
module Payshares
  class SCPBallot < XDR::Struct
    attribute :counter, Uint32
    attribute :value,   Value
  end
end
