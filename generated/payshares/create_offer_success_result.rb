# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct CreateOfferSuccessResult
#   {
#       // offers that got claimed while creating this offer
#       ClaimOfferAtom offersClaimed<>;
#   
#       union switch (CreateOfferEffect effect)
#       {
#       case CREATE_OFFER_CREATED:
#       case CREATE_OFFER_UPDATED:
#           OfferEntry offer;
#       default:
#           void;
#       }
#       offer;
#   };
#
# ===========================================================================
module Payshares
  class CreateOfferSuccessResult < XDR::Struct
    include XDR::Namespace

    autoload :Offer

    attribute :offers_claimed, XDR::VarArray[ClaimOfferAtom]
    attribute :offer,          Offer
  end
end
