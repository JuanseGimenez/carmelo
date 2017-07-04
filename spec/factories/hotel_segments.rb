FactoryGirl.define do
  factory :hotel_segment do
    association :trip, factory: :trip
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    direction { Faker::Address.street_address }
    start_date Time.now + 1.day + 5.hours
    end_date Time.now + 1.day + 7.hours
  end
end