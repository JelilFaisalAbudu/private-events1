# spec/features/visitor_signs_up_spec.rb
require 'rails_helper'

RSpec.feature 'Visitor signs up', type: :feature do
  scenario 'with valid email and name present' do
    sign_up_with 'name', 'valid@example.com'

    expect(page).to have_content('You have successfully registered')
  end

  scenario 'with invalid email' do
    sign_up_with 'validName', 'invalid_email.com'

    expect(page).to have_content('Sign up')
  end

  scenario 'with blank username and valid email' do
    sign_up_with '', 'valid@example.com'

    expect(page).to have_content('Sign up')
  end

  scenario 'with valid email and successful login' do
    login_with 'valid@example.com'
    expect(page).to_not  have_text('Sign up now!')
  end

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
