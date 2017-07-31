require 'bank_deposits/import'

module BankDeposits
  class DisplayInvestmentGrowth
    include Import["calculate_long_term_deposit_sum"]

    def call(deposit, years, annual_addition)
      total_investment = annual_addition * years
      total_growth = calculate_long_term_deposit_sum.call(deposit.interest_rate,
                                                          annual_addition,
                                                          years,
                                                          deposit.annual_compounds_count)
      total_interest = total_growth - total_investment

      puts "After #{years} years your investment will be worth $%.2f" % total_growth
      puts "Average investment is $%.2f" % total_investment
      puts "Interest is $%.2f" % total_interest
    end
  end
end
