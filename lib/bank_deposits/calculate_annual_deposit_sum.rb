# frozen_string_literal: true

module BankDeposits
  class CalculateAnnualDepositSum
    def call(interest_rate, principal, annual_compounds_count)
      interest_rate_per_compound = calculate_interest_rate_per_compound(interest_rate, annual_compounds_count)

      principal * ((1 + interest_rate_per_compound / 100)**annual_compounds_count)
    end

    private

    def calculate_interest_rate_per_compound(interest_rate, compounds_count)
      interest_rate.to_f / compounds_count
    end
  end
end
