class SearchesController < ApplicationController
	def search
		users = User.search "%#{params[:text].downcase}%", fields:[:name], limit: 2
		car_segments_origins = CarSegment.search "%#{params[:text].downcase}%", fields:[:origin], limit: 3
		cars_segments_destinations = CarSegment.search "%#{params[:text].downcase}%", fields:[:destination], limit: 3
		event_segments_names = EventSegment.search "%#{params[:text].downcase}%", fields:[:name], limit: 2
		respond_to do | format |
      		format.json{ render json: {
      			users: users.results,
      			car_segments_origins: car_segments_origins.results,
      			cars_segments_destinations: cars_segments_destinations.results,
      			event_segments_names: event_segments_names.results
      			}
      		}
    	end
	end
end