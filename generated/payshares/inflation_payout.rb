# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct inflationPayout // or use PaymentResultAtom to limit types?
#   {
#       AccountID destination;
#       int64 amount;
#   };
#
# ===========================================================================
module Payshares
  class InflationPayout < XDR::Struct
    attribute :destination, AccountID
    attribute :amount,      Int64
  end
end
