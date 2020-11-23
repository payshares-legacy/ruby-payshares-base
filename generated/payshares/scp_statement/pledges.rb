# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

# === xdr source ============================================================
#
#   union switch (SCPStatementType type)
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
#
# ===========================================================================
module Payshares
  class SCPStatement
    class Pledges < XDR::Union
      include XDR::Namespace

      autoload :Prepare

      switch_on SCPStatementType, :type

      switch :preparing, :prepare
      switch :prepared
      switch :committing
      switch :committed

      attribute :prepare, Prepare
    end
  end
end
