# # spec/features/management_spec.rb
require 'rails_helper'

RSpec.feature 'Event creattion and management', type: :feature do
  scenario 'with a visit to the home page' do
		visit root_path
		expect(page).to have_content('Welcome to our happy home, where all the interesting events are organized by friends for friends across the world to attend.')
		expect(page).to have_text('Sign up now!')

		# expect(page.find('header > .navbar').click).to  have_text('Log in')
		
	end

  scenario 'with a user who have not logged in and wants to create event' do
		visit new_event_path
		expect(current_path).to eq(login_path)
		expect(page).to  have_content('You must be logged in to perform this operation')
	end
	

	scenario 'with an unthorized user who wants to create event' do
		visit new_event_path
		expect(current_path).to eq(login_path)
		expect(page).to  have_content('You must be logged in to perform this operation')
	end
	
	scenario 'with an authorized user create a new event' do
		 sign_up_with('validUsername', 'validEmail@example.com')
		expect(page).to have_content('You have successfully registered.')  
		visit new_event_path

		fill_in "title",	with: "My Event Title"
		fill_in "location",	with: "My event location" 
		fill_in "date",	with: Date.new(2020, 10, 10)
		fill_in "description",	with: "My event description"
		click_on 'Submit' 
		expect(page).to have_content('Event successfully created')
	end

  # scenario 'invalid inputs for creating an event - duplicate descriptions' do
  #   visit '/sign_up'
  #   fill_in 'user_name', with: 'Marylene'
  #   click_on 'Submit'
  #   visit '/sign_in'
  #   fill_in 'user_name', with: 'Marylene'
  #   click_on 'Submit'

  #   click_on 'New Event'
  #   fill_in 'event_description', with: 'Cats Event'
  #   fill_in 'event_date', with: Date.today
  #   click_on 'Create Event'
  #   click_on 'New Event'
  #   fill_in 'event_description', with: 'Cats Event'
  #   fill_in 'event_date', with: Date.today
  #   click_on 'Create Event'
  #   expect(page).not_to have_content('success')
  #   expect(page).to have_content('Description has already been taken')
  # end

  # scenario 'invalid inputs for creating an event - date omitted' do
  #   visit '/sign_up'
  #   fill_in 'user_name', with: 'Marylene'
  #   click_on 'Submit'
  #   visit '/sign_in'
  #   fill_in 'user_name', with: 'Marylene'
  #   click_on 'Submit'

  #   click_on 'New Event'
  #   fill_in 'event_description', with: 'Cats Event'
  #   click_on 'Create Event'
  #   expect(page).not_to have_content('success')
  #   expect(page).to have_content('Date can\'t be blank')
  # end

  # scenario 'invalid inputs for creating an event - description omitted' do
  #   visit '/sign_up'
  #   fill_in 'user_name', with: 'Marylene'
  #   click_on 'Submit'
  #   visit '/sign_in'
  #   fill_in 'user_name', with: 'Marylene'
  #   click_on 'Submit'

  #   click_on 'New Event'
  #   fill_in 'event_date', with: Date.today
  #   click_on 'Create Event'
  #   expect(page).not_to have_content('success')
  #   expect(page).to have_content('Description can\'t be blank')
  # end

  # scenario 'invalid inputs for creating an event - description too short' do
  #   visit '/sign_up'
  #   fill_in 'user_name', with: 'Marylene'
  #   click_on 'Submit'
  #   visit '/sign_in'
  #   fill_in 'user_name', with: 'Marylene'
  #   click_on 'Submit'

  #   click_on 'New Event'
  #   fill_in 'event_description', with: 'Ca'
  #   fill_in 'event_date', with: Date.today
  #   click_on 'Create Event'
  #   expect(page).to have_content('Description is too short (minimum is 3 characters)')
	# end
	
	def sign_up_with(username, email)
    visit signup_path
    fill_in 'username', with: username
    fill_in 'email', with: email
    click_button 'Submit'
  end

  def login_with(email)
    visit login_path
    fill_in 'email', with: email
    click_button 'Sign In'
  end

  
end

