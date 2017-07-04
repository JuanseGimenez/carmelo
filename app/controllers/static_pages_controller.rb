class StaticPagesController < ApplicationController
  before_filter :check_session

  def home
  end

  private

  def check_session
    redirect_to home_path if current_user
  end
end
