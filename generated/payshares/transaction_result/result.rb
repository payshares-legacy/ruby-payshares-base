# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   union switch (TransactionResultCode code)
#       {
#       case txSUCCESS:
#       case txFAILED:
#           OperationResult results<>;
#       default:
#           void;
#       }
#
# ===========================================================================
module Payshares
  class TransactionResult
    class Result < XDR::Union
      switch_on TransactionResultCode, :code

      switch :tx_success, :results
      switch :tx_failed,  :results
      switch :default

      attribute :results, XDR::VarArray[OperationResult]
    end
  end
end
