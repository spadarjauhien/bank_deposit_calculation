# frozen_string_literal: true

require 'bank_deposits/import'

module BankDeposits
  class DisplayInvestmentGrowth
    include Import['calculate_long_term_deposit_sum']

    def call(deposit, years, annual_addition)
      total_investment = annual_addition * years
      total_growth = calculate_long_term_deposit_sum.call(deposit.interest_rate,
                                                          annual_addition,
                                                          years,
                                                          deposit.annual_compounds_count)
      total_interest = total_growth - total_investment

      print_investment_growth_information(years, deposit.currency, total_growth, total_investment, total_interest)
    end

    private

    def print_investment_growth_information(years, currency, total_growth, total_investment, total_interest)
      puts format("After #{years} years your investment will be worth %.2f #{currency}", total_growth)
      puts format("Average investment is %.2f #{currency}", total_investment)
      puts format("Interest is %.2f #{currency}", total_interest)
    end
  end
end
