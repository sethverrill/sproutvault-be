require 'rails_helper'

RSpec.describe DaycareProvider, type: :model do
  describe "assertions" do
    it { should have_many(:daycare_hours).dependent(:destroy) }
    it { should have_many(:children).through(:daycare_hours) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:provider_type) }
  end

  describe "enums" do
    it "defines provider_type with correct mappings" do
      expect(described_class.provider_types).to eq({
        "daycare" => 0,
        "nanny" => 1,
        "family" => 2,
        "parent" => 3,
        "other" => 4
      })
    end
  end
end
