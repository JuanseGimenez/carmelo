FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    provider 'facebook'
    uid { Faker::Number.number(16) }
    facebook_image_url { Faker::Avatar.image }
    location { Faker::Address.city }
    phone_number { Faker::PhoneNumber.phone_number }
    gender "Gender"
    birthdate { Faker::Date.birthday }
  end
end