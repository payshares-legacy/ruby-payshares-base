# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   enum SCPStatementType
#   {
#       PREPARING = 0,
#       PREPARED = 1,
#       COMMITTING = 2,
#       COMMITTED = 3
#   };
#
# ===========================================================================
module Payshares
  class SCPStatementType < XDR::Enum
    member :preparing,  0
    member :prepared,   1
    member :committing, 2
    member :committed,  3

    seal
  end
end
