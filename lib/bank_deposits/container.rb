# frozen_string_literal: true

require 'dry/container'

module BankDeposits
  module Container
    extend Dry::Container::Mixin

    register 'calculate_annual_deposit_sum' do
      CalculateAnnualDepositSum.new
    end

    register 'calculate_long_term_deposit_sum' do
      CalculateLongTermDepositSum.new
    end
  end
end
