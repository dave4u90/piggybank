FactoryBot.define do
  factory :currency do
    sequence(:name) { |i| "Currency #{i}" }
    sequence(:code) { |i| "CUR#{i}" }

    factory :currency_with_prices do
      transient do
        prices_count { 5 }
      end

      after(:create) do |currency, evaluator|
        create_list(:price, evaluator.prices_count, currency: currency)
      end
    end
  end
end
