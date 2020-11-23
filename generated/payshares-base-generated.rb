# Automatically generated on 2015-04-26T19:13:29-07:00
# DO NOT EDIT or your changes may be overwritten
        
require 'xdr'

module Payshares
  include XDR::Namespace

  Signature = XDR::Opaque[64]
  Hash = XDR::Opaque[32]
  Uint256 = XDR::Opaque[32]
  Uint32 = XDR::UnsignedInt
  Uint64 = XDR::UnsignedHyper
  Value = XDR::VarOpaque[]
  Evidence = XDR::VarOpaque[]

  autoload :SCPBallot

  autoload :SCPStatementType

  autoload :SCPStatement
  autoload :SCPEnvelope
  autoload :SCPQuorumSet
end
module Payshares
  include XDR::Namespace

  autoload :LedgerEntryType

  autoload :Signer

  autoload :AccountFlags

  autoload :AccountEntry
  autoload :TrustLineEntry
  autoload :OfferEntry

  autoload :LedgerEntry
end
module Payshares
  include XDR::Namespace

  autoload :LedgerHeader

  autoload :LedgerKey

  autoload :BucketEntryType

  autoload :BucketEntry

  autoload :TransactionSet
  autoload :TransactionResultPair
  autoload :TransactionResultSet
  autoload :TransactionMeta
  autoload :TransactionHistoryEntry
  autoload :TransactionHistoryResultEntry
  autoload :LedgerHeaderHistoryEntry
end
module Payshares
  include XDR::Namespace

  autoload :PaysharesBallotValue
  autoload :PaysharesBallot
  autoload :Error
  autoload :Hello
  autoload :PeerAddress

  autoload :MessageType

  autoload :DontHave

  autoload :PaysharesMessage
end
module Payshares
  include XDR::Namespace

  autoload :DecoratedSignature

  autoload :OperationType

  autoload :PaymentOp
  autoload :CreateOfferOp
  autoload :SetOptionsOp
  autoload :ChangeTrustOp
  autoload :AllowTrustOp
  autoload :Operation
  autoload :Transaction
  autoload :TransactionEnvelope
  autoload :ClaimOfferAtom

  autoload :PaymentResultCode

  autoload :SimplePaymentResult
  autoload :PaymentSuccessMultiResult

  autoload :PaymentResult

  autoload :CreateOfferResultCode
  autoload :CreateOfferEffect

  autoload :CreateOfferSuccessResult

  autoload :CreateOfferResult

  autoload :SetOptionsResultCode

  autoload :SetOptionsResult

  autoload :ChangeTrustResultCode

  autoload :ChangeTrustResult

  autoload :AllowTrustResultCode

  autoload :AllowTrustResult

  autoload :AccountMergeResultCode

  autoload :AccountMergeResult

  autoload :InflationResultCode

  autoload :InflationPayout

  autoload :InflationResult

  autoload :OperationResultCode

  autoload :OperationResult

  autoload :TransactionResultCode

  autoload :TransactionResult
end
module Payshares
  include XDR::Namespace

  Uint512 = XDR::Opaque[64]
  Uint256 = XDR::Opaque[32]
  Uint64 = XDR::UnsignedHyper
  Int64 = XDR::Hyper
  Uint32 = XDR::UnsignedInt
  Int32 = XDR::Int
  AccountID = XDR::Opaque[32]
  Signature = XDR::Opaque[64]
  Hash = XDR::Opaque[32]
  Thresholds = XDR::Opaque[4]
  SequenceNumber = Uint64

  autoload :CurrencyType

  autoload :ISOCurrencyIssuer

  autoload :Currency

  autoload :Price
end
module Payshares
  include XDR::Namespace
end
