class Booking < ApplicationRecord
  belongs_to :listing
  # belongs_to :user # Agar aapne Devise/User model banaya hai toh ise uncomment karein

  # Basic validations taaki galat data save na ho
  validates :start_date, :end_date, :guests, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
