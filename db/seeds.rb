require 'faker'

User.destroy_all
Child.destroy_all
DaycareProvider.destroy_all
DaycareHour.destroy_all

user = User.create!(
  first_name: "Greg",
  last_name: "Grant",
  email: "greg@email.com",
password_digest: BCrypt::Password.create("easypass123")
)

3.times do
  child = user.children.create!(
    name: Faker::Name.first_name,
    birthdate: Faker::Date.between(from: (4.years + 6.months).ago, to: 6.months.ago)
  )

  provider = DaycareProvider.create!(
    name: Faker::Company.name,
    provider_type: rand(0..4)
  )

  5.times do
    start_time = Faker::Time.between(from: DateTime.now.beginning_of_day + 7.hours, to: DateTime.now.beginning_of_day + 9.hours)
    end_time = Faker::Time.between(from: start_time + 5.hours, to: start_time + 8.hours)

    DaycareHour.create!(
      child: child,
      daycare_provider_id: provider.id,
      date: Faker::Date.backward(days: 60),
      start_time: start_time,
      end_time: end_time,
      duration: end_time- start_time
    )
  end
end
