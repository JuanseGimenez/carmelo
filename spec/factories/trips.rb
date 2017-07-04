FactoryGirl.define do
  factory :trip do
    association :owner, factory: :user
    name { Faker::Lorem.sentence }
    start_date Time.now + 1.day
    end_date Time.now + 10.day
  end
end
