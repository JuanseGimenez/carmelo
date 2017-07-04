class Relationship < ApplicationRecord
  belongs_to :subscriber, class_name: "User"
  belongs_to :trip, class_name: "Trip"

  validates :subscriber_id, presence: true
  validates :trip_id, presence: true
end
