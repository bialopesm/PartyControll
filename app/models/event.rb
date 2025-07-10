class Event < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :date, presence: true
  validates :event_type, presence: true, inclusion: { in: ['Wedding', 'Birthday', 'Anniversary', 'Corporate', 'Other'] }
  validates :place, length: { maximum: 200 }, allow_blank: true
  validates :description, length: { maximum: 500 }, allow_blank: true
  validates :status, inclusion: { in: ['Planning', 'Confirmed', 'In Progress', 'Completed', 'Cancelled'] }, allow_blank: true
  validates :supplier, length: { maximum: 1000 }, allow_blank: true

  # Ensure date is not in the past
  validate :date_cannot_be_in_the_past

  private

  def date_cannot_be_in_the_past
    if date.present? && date < Date.current
      errors.add(:date, "cannot be in the past")
    end
  end
end
