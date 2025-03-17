FactoryBot.define do
  factory :daycare_provider do
    name { Faker::Company.name }
    provider_type { %w[Daycare Nanny Family Friend].sample }
  end
end
