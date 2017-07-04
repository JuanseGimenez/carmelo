class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_filter  :verify_authenticity_token
  before_filter :check_activation, only: [:new, :create, :edit, :update, :show, :home, :search]

  def check_activation
    if current_user
      redirect_to activation_user_path if !current_user.active
    end
  end
end
