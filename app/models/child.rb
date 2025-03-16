class Child < ApplicationRecord
  belongs_to :user
  has_many :daycare_hours, dependent: :destroy
  has_many :daycare_providers, through: :daycare_hours

  validates :name, presence: true
  validates :birthdate, presence: true
end
