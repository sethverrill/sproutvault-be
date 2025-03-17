FactoryBot.define do
  factory :daycare_hour do
    association :daycare_provider
    association :child
    date { Faker::Date.backward(days: 30) }
    start_time { "08:00" }
    end_time { "15:30" }
    duration { 5.5 }
  end
end
