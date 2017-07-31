require 'dry-types'

module BankDeposits
  module Types
    include Dry::Types.module

    InterestRate = Strict::Float.constrained(gt: 0.0)
  end
end
