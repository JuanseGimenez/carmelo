class CarSegment < ApplicationRecord
  searchkick
  belongs_to :trip, class_name: 'Trip', foreign_key: 'trip_id'
  belongs_to :car, class_name: 'Car', foreign_key: 'car_id'

  #validations

  validates :name, presence: true
  validates :description, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end