FactoryBot.define do
  factory :daycare_hour do
    daycare_provider
    child
    date { Faker::Date.backward(days: 60) }
    start_time { Faker::Time.between(from: DateTime.now.beginning_of_day + 7.hours, to: DateTime.now.beginning_of_day + 9.hours) }
    end_time { Faker::Time.between(from: DateTime.now.beginning_of_day + 13.hours, to: DateTime.now.beginning_of_day + 16.hours) }
    duration { end_time - start_time }
  end
end
