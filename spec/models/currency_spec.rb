require 'rails_helper'

RSpec.describe Currency, type: :model do
  let(:price)    { FactoryBot.create(:price) }
  let(:currency) { FactoryBot.create(:currency_with_prices) }
  
  it { is_expected.to have_many(:prices) }

  describe '#latest_price' do
    it 'should return the latest price' do
      currency.prices << price
      expect(currency.latest_price).to eq(price.last)
    end

    it 'should return nil when there is no price associated' do
      currency.prices.destroy_all
      expect(currency.latest_price).to be_nil
    end
  end

  describe '#previous_price' do
    it 'should return the last price' do
      currency.prices << price
      expect(currency.previous_price).to eq(price.prev_close)
    end

    it 'should return nil when there is no price associated' do
      currency.prices.destroy_all
      expect(currency.previous_price).to be_nil
    end
  end
end
