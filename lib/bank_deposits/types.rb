# frozen_string_literal: true

require 'dry-types'

module BankDeposits
  module Types
    include Dry::Types.module

    Currency = Strict::String.constrained(format: /\A[A-Z]{3}\z/)
    InterestRate = Strict::Float.constrained(gt: 0.0)
  end
end
