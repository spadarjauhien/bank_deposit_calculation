require 'bank_deposits/calculate_long_term_deposit_sum'

# Expected results are calculated with CalculateStuff.com:
# https://www.calculatestuff.com/financial/compound-interest-calculator

RSpec.describe BankDeposits::CalculateLongTermDepositSum, '#call' do
  subject do
    calculate_deposit_sum_for_year.(interest_rate, annual_addition, years, annual_compounds_count).round(2)
  end

  let(:calculate_deposit_sum_for_year) { described_class.new }

  context 'when interest rate is 10, annual addition is 100, 5 years to grow, interest compounds 1 time annually' do
    let(:interest_rate) { 10 }
    let(:annual_addition) { 100 }
    let(:years) { 5 }
    let(:annual_compounds_count) { 1 }

    it { is_expected.to eq(671.56) }
  end

  context 'when interest rate is 14, annual addition is 150, 10 years to grow, interest compounds 4 times annually' do
    let(:interest_rate) { 14 }
    let(:annual_addition) { 150 }
    let(:years) { 10 }
    let(:annual_compounds_count) { 4 }

    it { is_expected.to eq(3_452.84) }
  end

  context 'when interest rate is 12, annual addition is 200, 8 years to grow, interest compounds 2 times annually' do
    let(:interest_rate) { 12 }
    let(:annual_addition) { 200 }
    let(:years) { 8 }
    let(:annual_compounds_count) { 2 }

    it { is_expected.to eq(2_800.55) }
  end

  context 'when interest rate is 9, annual addition is 500, 20 years to grow, interest compounds 12 times annually' do
    let(:interest_rate) { 9 }
    let(:annual_addition) { 500 }
    let(:years) { 20 }
    let(:annual_compounds_count) { 12 }

    it { is_expected.to eq(29_203.85) }
  end
end
