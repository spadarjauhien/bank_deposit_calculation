# frozen_string_literal: true

require 'bank_deposits/import'

module BankDeposits
  class CalculateLongTermDepositSum
    include Import['calculate_annual_deposit_sum']

    def call(interest_rate, annual_addition, years, annual_compounds_count)
      years.times.reduce(0) do |period_start_sum, _year|
        calculate_annual_deposit_sum.call(interest_rate, (period_start_sum + annual_addition), annual_compounds_count)
      end
    end
  end
end
