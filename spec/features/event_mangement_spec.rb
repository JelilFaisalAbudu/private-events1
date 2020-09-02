# # spec/features/management_spec.rb
require 'rails_helper'

RSpec.feature 'Event creation and management', type: :feature do
  scenario 'with a visit to the home page' do
    visit root_path
    expect(page).to have_text('Sign up now!')
  end

  scenario 'with a user who have not logged in and wants to create event' do
    visit new_event_path
    expect(page).to have_content('You must be logged in to perform this operation')
  end

  scenario 'with an authorized user create a new event' do
    sign_up_with('validUsername', 'validEmail@example.com')
    expect(page).to have_content('You have successfully registered.')
    visit new_event_path

    fill_in 'title',	with: 'My Event Title'
    fill_in 'location',	with: 'My event location'
    fill_in 'date',	with: Date.new(2020, 10, 10)
    fill_in 'description',	with: 'My event description'
    click_on 'Submit'
    expect(page).to have_content('Event successfully created')
  end

  def sign_up_with(username, email)
    visit signup_path
    fill_in 'username', with: username
    fill_in 'email', with: email
    click_button 'Submit'
  end
end
