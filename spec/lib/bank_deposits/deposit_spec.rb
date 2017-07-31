require 'bank_deposits/deposit'

RSpec.describe BankDeposits::Deposit do
  let(:name) { nil }
  let(:interest_rate) { nil }
  let(:annual_compounds_count) { nil }

  def construct_deposit
    described_class.new(name: name, interest_rate: interest_rate, annual_compounds_count: annual_compounds_count)
  end

  context 'when all attributes are set and valid' do
    let(:name) { 'My Super Deposit' }
    let(:interest_rate) { 9.5 }
    let(:annual_compounds_count) { 4 }

    it 'constructs instance of Deposit class with set attributes', aggregate_failures: true do
      deposit = construct_deposit

      expect(deposit).to be_a(::BankDeposits::Deposit)
      expect(deposit.name).to eq(name)
      expect(deposit.interest_rate).to eq(interest_rate)
      expect(deposit.annual_compounds_count).to eq(annual_compounds_count)
    end
  end

  context 'when no one attribute is set' do
    let(:name) { nil }
    let(:interest_rate) { nil }
    let(:annual_compounds_count) { nil }

    it 'raises error while constructing new object' do
      expect { construct_deposit }.to raise_error(Dry::Struct::Error)
    end
  end

  context 'when all attributes are set but not all are valid' do
    let(:name) { 'My Super Deposit' }
    let(:interest_rate) { 10.0 }
    let(:annual_compounds_count) { 12 }

    shared_examples 'it raises error while constructing new object' do
      it 'raises error while constructing new object' do
        expect { construct_deposit }.to raise_error(Dry::Struct::Error)
      end
    end

    context 'when name is blank' do
      let(:name) { '' }

      include_examples 'it raises error while constructing new object'
    end

    context 'when interest_rate is negative' do
      let(:interest_rate) { -10 }

      include_examples 'it raises error while constructing new object'
    end

    context 'when annual_compounds_count is zero' do
      let(:annual_compounds_count) { 0 }

      include_examples 'it raises error while constructing new object'
    end
  end
end
