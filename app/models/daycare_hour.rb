class DaycareHour < ApplicationRecord
  belongs_to :daycare_provider
  belongs_to :child

  validates :date, :start_time, :end_time, presence: true
  validate :end_time_after_start_time

  before_validation :calculate_duration

  private

  def end_time_after_start_time
    return unless start_time && end_time

    if end_time <= start_time
      errors.add(:end_time, "Must be after start time")
    end
  end

  def calculate_duration
    return unless start_time && end_time
    raw_duration = (end_time - start_time) / 3600.0
    self.duration = raw_duration.negative? ? raw_duration + 24.0 : raw_duration
  end
end
