class Child < ApplicationRecord
  belongs_to :user
  has_many :daycare_hours, class_name: "DaycareHour", dependent: :destroy
  has_many :daycare_providers, through: :daycare_hours

  validates :name, presence: true
  validates :birthdate, presence: true
end
