# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct ChangeTrustOp
#   {
#       Currency line;
#   
#       // if limit is set to 0, deletes the trust line
#       int64 limit;
#   };
#
# ===========================================================================
module Payshares
  class ChangeTrustOp < XDR::Struct
    attribute :line,  Currency
    attribute :limit, Int64
  end
end
