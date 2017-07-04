class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def home
    @trips = current_user.trips + current_user.subscribing
    @last_users = User.last(5)
  end
end
