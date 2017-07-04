class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def index
    @friends = current_user.friends
    @trips = current_user.trips + current_user.subscribing
  end
end