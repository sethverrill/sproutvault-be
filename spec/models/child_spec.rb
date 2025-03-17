require 'rails_helper'
require 'daycare_hour'

RSpec.describe Child, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:daycare_hours).dependent(:destroy) }
    it { should have_many(:daycare_providers).through(:daycare_hours) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:birthdate) }
  end
end
