FactoryGirl.define do
  factory :car do
    association :owner, factory: :user
    model "Model"
    name { Faker::Vehicle.manufacture }
    year { Faker::Date.between(20.years.ago, Date.today).year }
    places 3
  end
end