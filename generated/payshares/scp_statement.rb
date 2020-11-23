# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   struct SCPStatement
#   {
#       uint64 slotIndex;   // i
#       SCPBallot ballot;   // b
#       Hash quorumSetHash; // D
#   
#       union switch (SCPStatementType type)
#       {
#       case PREPARING:
#           struct
#           {
#               SCPBallot excepted<>; // B_c
#               SCPBallot* prepared;  // p
#           } prepare;
#       case PREPARED:
#       case COMMITTING:
#       case COMMITTED:
#           void;
#       }
#       pledges;
#   };
#
# ===========================================================================
module Payshares
  class SCPStatement < XDR::Struct
    include XDR::Namespace

    autoload :Pledges

    attribute :slot_index,      Uint64
    attribute :ballot,          SCPBallot
    attribute :quorum_set_hash, Hash
    attribute :pledges,         Pledges
  end
end
