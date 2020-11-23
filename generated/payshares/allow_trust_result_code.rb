# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   enum AllowTrustResultCode
#   {
#       // codes considered as "success" for the operation
#       ALLOW_TRUST_SUCCESS = 0,
#       // codes considered as "failure" for the operation
#       ALLOW_TRUST_MALFORMED = -1,         // currency is not ISO4217
#       ALLOW_TRUST_NO_TRUST_LINE = -2,     // trustor does not have a trustline
#       ALLOW_TRUST_TRUST_NOT_REQUIRED = -3 // source account does not require trust
#   };
#
# ===========================================================================
module Payshares
  class AllowTrustResultCode < XDR::Enum
    member :allow_trust_success,            0
    member :allow_trust_malformed,          -1
    member :allow_trust_no_trust_line,      -2
    member :allow_trust_trust_not_required, -3

    seal
  end
end
