# frozen_string_literal: true

require 'bank_deposits/calculate_annual_deposit_sum'

# Expected results are calculated with CalculateStuff.com:
# https://www.calculatestuff.com/financial/compound-interest-calculator

RSpec.describe BankDeposits::CalculateAnnualDepositSum, '#call' do
  subject { calculate_annual_deposit_sum.call(interest_rate, principal, annual_compounds_count).round(2) }

  let(:calculate_annual_deposit_sum) { described_class.new }

  context 'when interest rate is 10, principal is 100 and interest compounds 1 time annually' do
    let(:interest_rate) { 10 }
    let(:principal) { 100 }
    let(:annual_compounds_count) { 1 }

    it { is_expected.to eq(110) }
  end

  context 'when interest rate is 14, principal is 150 and interest compounds 3 times annually' do
    let(:interest_rate) { 14 }
    let(:principal) { 150 }
    let(:annual_compounds_count) { 3 }

    it { is_expected.to eq(172.00) }
  end

  context 'when interest rate is 12, principal is 200 and interest compounds 6 times annually' do
    let(:interest_rate) { 12 }
    let(:principal) { 200 }
    let(:annual_compounds_count) { 6 }

    it { is_expected.to eq(225.23) }
  end

  context 'when interest rate is 9, principal is 500 and interest compounds 12 times annually' do
    let(:interest_rate) { 9 }
    let(:principal) { 500 }
    let(:annual_compounds_count) { 12 }

    it { is_expected.to eq(546.90) }
  end
end
