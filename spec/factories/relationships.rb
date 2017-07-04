FactoryGirl.define do
  factory :relationship do
    association :subscriber, factory: :user
    association :trip, factory: :trip
  end
end
