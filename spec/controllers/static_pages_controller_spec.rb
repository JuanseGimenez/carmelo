require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  subject { FactoryGirl.create(:user) }

  it "Success without user" do
    get :home
    expect(response).to have_http_status(:success)
  end

  it "Not success with user" do
    sign_in subject
    get :home
    expect(response).to_not have_http_status(:success)
  end

end
