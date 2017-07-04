FactoryGirl.define do
  factory :post do
    association :user, factory: :user
    association :trip, factory: :trip
    content { Faker::Lorem.paragraph }
  end
end
