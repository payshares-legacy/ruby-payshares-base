# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct OfferEntry
#   {
#       AccountID accountID;
#       uint64 offerID;
#       Currency takerGets; // A
#       Currency takerPays; // B
#       int64 amount;       // amount of A
#   
#       /* price for this offer:
#           price of A in terms of B
#           price=AmountB/AmountA=priceNumerator/priceDenominator
#           price is after fees
#       */
#       Price price;
#   };
#
# ===========================================================================
module Payshares
  class OfferEntry < XDR::Struct
    attribute :account_id, AccountID
    attribute :offer_id,   Uint64
    attribute :taker_gets, Currency
    attribute :taker_pays, Currency
    attribute :amount,     Int64
    attribute :price,      Price
  end
end
