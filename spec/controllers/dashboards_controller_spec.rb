require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe DashboardsController, type: :controller do

  subject { FactoryGirl.create(:user) }

  it "not get dashboard without user" do
    get :home
    expect(response).to_not have_http_status(:success)
  end

  it "get dashboard with user" do
    sign_in subject
    get :home
    expect(response).to have_http_status(:success)
  end

end
