require 'rails_helper'

feature 'Static Page Home' do
    scenario 'Sign in with Facebook expect' do
        #Use capybara to auto complete forms and navigate
        visit('/')
        expect(page).to have_content("Sign in with Facebook")
    end
end
