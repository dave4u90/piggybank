require 'rails_helper'
require 'stubs/coinjars'

include Stubs::Coinjars

RSpec.describe Price, type: :model do
  let!(:btc) { FactoryBot.create(:currency, code: 'BTCAUD') }
  let!(:eth) { FactoryBot.create(:currency, code: 'ETHAUD') }
  
  it { is_expected.to belong_to(:currency) }

  describe '.capture!' do
    subject(:captured) { Price.capture! }

    context 'when all the currency API returns success' do
      it 'should store all the price information into the database' do
        stub_complete_success!
        expect { Price.capture! }.to change { Price.count }.by(2)
      end
    end

    context 'when any one of the API returns a failure or error' do
      it 'should not store any price information into the database' do
        stub_partial_success!
        expect { Price.capture! }.to_not change { Price.count }
      end
    end

    context 'when all of the API returns a failure or error' do
      it 'should not store any price information into the database' do
        stub_full_failure!
        expect { Price.capture! }.to_not change { Price.count }
      end
    end

    context 'when any of the API returns an invalid response' do
      it 'should not store any price information into the database' do
        stub_invalid!
        expect { Price.capture! }.to_not change { Price.count }
      end
    end
  end
end
