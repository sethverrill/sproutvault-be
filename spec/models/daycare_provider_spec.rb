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
end
