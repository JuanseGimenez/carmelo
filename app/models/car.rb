class Car < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  #validations

  validates :model, presence: true
  validates :name, presence: true
  validates :year, presence: true
  validates :places, presence: true

  def car_with_model
    "#{name} #{model}"
  end
end
