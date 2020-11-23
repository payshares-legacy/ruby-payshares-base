# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct Signer
#   {
#       uint256 pubKey;
#       uint32 weight; // really only need 1byte
#   };
#
# ===========================================================================
module Payshares
  class Signer < XDR::Struct
    attribute :pub_key, Uint256
    attribute :weight,  Uint32
  end
end
