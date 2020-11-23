# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct AllowTrustOp
#   {
#       AccountID trustor;
#       union switch (CurrencyType type)
#       {
#       // NATIVE is not allowed
#       case ISO4217:
#           opaque currencyCode[4];
#   
#           // add other currency types here in the future
#       }
#       currency;
#   
#       bool authorize;
#   };
#
# ===========================================================================
module Payshares
  class AllowTrustOp < XDR::Struct
    include XDR::Namespace

    autoload :Currency

    attribute :trustor,   AccountID
    attribute :currency,  Currency
    attribute :authorize, XDR::Bool
  end
end
