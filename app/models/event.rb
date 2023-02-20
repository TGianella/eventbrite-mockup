class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true
  validate :start_date_not_in_the_past
  validates :duration,
            presence: true,
            numericality: { greater_than: 0 }
  validate :duration_multiple_of_5
  validates :title,
            presence: true,
            length: { in: 5..140 }
  validates :description,
            presence: true,
            length: { in: 20..1000 }
  validates :price,
            presence: true,
            numericality: { in: 1..1000 }
  validates :location, presence: true

  def start_date_not_in_the_past
    return unless start_date.present? && start_date < Date.today

    errors.add(:start_date, "ne peut pas être plus tôt qu'aujourd'hui")
  end

  def duration_multiple_of_5
    return unless duration.present? && (duration % 5) != 0

    errors.add(:duration, 'doit être un multiple de 5')
  end
end
