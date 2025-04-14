FactoryBot.define do
  factory :daycare_provider do
    name { Faker::Company.name }
    provider_type { DaycareProvider.provider_types.keys.sample.to_sym }
  end
end
