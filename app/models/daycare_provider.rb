class DaycareProvider < ApplicationRecord
  enum provider_type: {
    daycare: 0,
    nanny: 1,
    family: 2,
    parent: 3,
    other: 4
  }
  has_many :daycare_hours, dependent: :destroy
  has_many :children, through: :daycare_hours

  validates :name, presence: true, uniqueness: true
  validates :provider_type, presence: true
end
