class Trip < ApplicationRecord
  searchkick
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "trip_id",
                                   dependent:   :destroy
  has_many :subscribers, through: :passive_relationships, source: :subscriber
  has_many :posts, dependent: :destroy
  has_many :car_segments
  has_many :hotel_segments
  has_many :event_segments

  #validations

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :name, presence: true
  validate :validate_dates
  validate :validate_start_date

  private

  def validate_dates
    if self.start_date && self.end_date
      if self.start_date > self.end_date
        errors.add(:end_date, "can't be inferior to start date")
      end
    end
  end

  def validate_start_date
    if self.start_date
      if self.start_date < Time.zone.now
        errors.add(:start_date, "can't be inferior to current date")
      end
    end
  end
end
