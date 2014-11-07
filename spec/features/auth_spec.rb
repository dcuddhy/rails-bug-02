require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("user@example.com")
  end

  scenario 'When a user registers, they should be logged in automatically' do

    visit new_registration_path
    expect(page).to have_content("Confirm")
    fill_in "Name", with: "Ron Swanson"
    fill_in "Email", with: "ron@swanson.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    click_on "Register!"
    expect(page).to have_content("logged in successfully")

  end



end
