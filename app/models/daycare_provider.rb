class DaycareProvider < ApplicationRecord
  has_many :daycare_hours, dependent: :destroy
  has_many :children, through: :daycare_hours

  validates :name, presence: true, uniqueness: true
  validates :provider_type, presence: true
end
