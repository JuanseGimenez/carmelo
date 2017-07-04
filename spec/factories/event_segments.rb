FactoryGirl.define do
  factory :event_segment do
    association :trip, factory: :trip
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    start_date Time.now + 1.day + 5.hours
    end_date Time.now + 1.day + 7.hours
  end
end