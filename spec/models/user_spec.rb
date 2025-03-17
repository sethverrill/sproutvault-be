require 'rails_helper'
require 'daycare_hour'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe "associations" do
    it { should have_many(:children).dependent(:destroy) }
    it { should have_many(:daycare_hours).through(:children) }
    it { should have_many(:daycare_providers).through(:daycare_hours) }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value("validtest@email.com").for(:email) }
    it { should_not allow_value("invalid-email-address").for(:email) }
    it { should validate_length_of(:password).is_at_least(8) }
  end
end
