class User < ApplicationRecord
  has_secure_password

  before_save :downcase_email

  has_many :children, dependent: :destroy
  has_many :daycare_hours, through: :children, class_name: "DaycareHour"
  has_many :daycare_providers, through: :daycare_hours

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false, message: "has already been taken" }, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :password, length: { minimum: 8 }, if: -> { password.present? }

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
