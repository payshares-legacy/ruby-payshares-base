# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct CreateOfferOp
#   {
#       Currency takerGets;
#       Currency takerPays;
#       int64 amount; // amount taker gets. if set to 0, delete the offer
#       Price price;  // =takerPaysAmount/takerGetsAmount
#   
#       // 0=create a new offer, otherwise edit an existing offer
#       uint64 offerID;
#   };
#
# ===========================================================================
module Payshares
  class CreateOfferOp < XDR::Struct
    attribute :taker_gets, Currency
    attribute :taker_pays, Currency
    attribute :amount,     Int64
    attribute :price,      Price
    attribute :offer_id,   Uint64
  end
end
