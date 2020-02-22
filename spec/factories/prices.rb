FactoryBot.define do
  factory :price do
    volume_24h { BigDecimal SecureRandom.random_number(100000) }
    volume { BigDecimal SecureRandom.random_number(100000) }
    transition_time { Time.zone.now }
    status { 'continous' }
    session { SecureRandom.random_number 10000 }
    prev_close { BigDecimal SecureRandom.random_number(100000) }
    last { BigDecimal SecureRandom.random_number(100000) }
    current_time { Time.zone.now }
    bid { BigDecimal SecureRandom.random_number(100000) }
    ask { BigDecimal SecureRandom.random_number(100000) }

    association :currency, factory: :currency, strategy: :build
  end
end
