# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct TransactionResultPair
#   {
#       Hash transactionHash;
#       TransactionResult result; // result for the transaction
#   };
#
# ===========================================================================
module Payshares
  class TransactionResultPair < XDR::Struct
    attribute :transaction_hash, Hash
    attribute :result,           TransactionResult
  end
end
