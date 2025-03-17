require 'rails_helper'

RSpec.describe DaycareHour, type: :model do
  describe "associations" do
    it { should belong_to(:daycare_provider) }
    it { should belong_to(:child) }
  end

  describe "validations" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }
  end

  describe "time management handling" do
    it "ensures end_time is after start_time" do
      daycare_hour = build(:daycare_hour,
        start_time: Time.zone.parse("11:00"),
        end_time: Time.zone.parse("09:00")
      )

      daycare_hour.valid?
      expect(daycare_hour.errors[:end_time]).to include("Must be after start time")
    end
  end

  describe "duration" do
    it "calculates duration before saving" do
      daycare_hour = build(:daycare_hour, start_time: "08:00", end_time: "13:30")
      daycare_hour.valid?
      expect(daycare_hour.duration).to eq(5.5)
    end

    it "calculates duration for overnight times" do
      daycare_hour = build(:daycare_hour,
        date: Date.today,
        start_time: Time.zone.parse("2025-03-17 20:00"),
        end_time: Time.zone.parse("2025-03-18 08:00")
      )
      daycare_hour.valid?
      expect(daycare_hour.duration).to eq(12.0)
    end
  end
end
