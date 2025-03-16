FactoryBot.define do
  factory :child do
    name { Faker::Name.first_name }
    birthdate { Faker::Date.between(from: (4.years + 6.months).ago, to: 6.months.ago) }
    user
  end
end
