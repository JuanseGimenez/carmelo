class EventSegment < ApplicationRecord
	searchkick
  belongs_to :trip, class_name: 'Trip', foreign_key: 'trip_id'

  #validations

  validates :name, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end