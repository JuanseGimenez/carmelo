# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_girl_rails'
puts "Creating Data..."

# Normal User with Car and Trips owners
10.times do |user|
  @user = FactoryGirl.create(:user)
  @car = FactoryGirl.create(:car, owner: @user)
  @trip = FactoryGirl.create(:trip, owner: @user)
  @event_segment = FactoryGirl.create(:event_segment, trip: @trip)
  @car_segment_go = FactoryGirl.create(:car_segment, trip: @trip, car: @car, name: "Ida")
  @car_segment_return = FactoryGirl.create(:car_segment, trip: @trip, car: @car, name: "Vuelta")
  @hotel_segment = FactoryGirl.create(:hotel_segment, trip: @trip)
  puts "Creating user #{@user.id} --- #{@user.name}"
  puts "Creating car --- #{@car.name}"
  puts "Creating trip --- #{@trip.name}"
  puts "Creating event segment --- #{@event_segment.name}"
  puts "Creating car segment go --- #{@car_segment_go.name}"
  puts "Creating car segment return --- #{@car_segment_return.name}"
  puts "Creating hotel segment with direction --- #{@hotel_segment.direction}"
  puts "\n"
end

# Friend relationships
user  = User.first
users = User.all
friends = users[1..10]
friends.each { |friend| FactoryGirl.create(:friendship, user: user, friend: friend) }
puts  "Created friendships relation"