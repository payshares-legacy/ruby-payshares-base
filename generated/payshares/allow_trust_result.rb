# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   union AllowTrustResult switch (AllowTrustResultCode code)
#   {
#   case ALLOW_TRUST_SUCCESS:
#       void;
#   default:
#       void;
#   };
#
# ===========================================================================
module Payshares
  class AllowTrustResult < XDR::Union
    switch_on AllowTrustResultCode, :code

    switch :allow_trust_success
    switch :default

  end
end
