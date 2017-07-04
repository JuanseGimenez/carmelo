FactoryGirl.define do
  factory :car_segment do
    association :car, factory: :car
    association :trip, factory: :trip
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    origin { Faker::Address.city }
    destination { Faker::Address.city }
    start_date Time.now + 1.day + 5.hours
    end_date Time.now + 1.day + 7.hours
  end
end