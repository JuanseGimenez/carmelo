class TripRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "trip_rooms_#{params['trip_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_post(data)
    current_user.posts.create!(content: data['post'], trip_id: data['trip_room_id'])
  end
end