# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   enum BucketEntryType
#   {
#       LIVEENTRY = 0,
#       DEADENTRY = 1
#   };
#
# ===========================================================================
module Payshares
  class BucketEntryType < XDR::Enum
    member :liveentry, 0
    member :deadentry, 1

    seal
  end
end
