require 'dry-struct'
require 'bank_deposits/types'

module BankDeposits
  class Deposit < Dry::Struct
    attribute :name, Types::Coercible::String.constrained(min_size: 1)
    attribute :interest_rate, Types::InterestRate
    attribute :annual_compounds_count, Types::Strict::Int.constrained(gt: 0)
  end
end
