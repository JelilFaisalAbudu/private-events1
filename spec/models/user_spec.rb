require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validate users attributes' do
    user = User.new

    it 'should invalidate the absence of username' do
      user.email = 'user@example.com'
      expect(user).to_not be_valid
    end

    it 'validates the presence of both username and email' do
      user.username = 'Example User'
      expect(user).to be_valid
    end

    it 'should reject user with improperly formatted email' do
      user.email = 'userexample.com'
      expect(user).to_not be_valid
    end

    it 'should change all upper case letters to down case in the email' do
      user.email = 'usEr@EmAiL.COM'
      user.save
      expect(user.email).to match('user@email.com')
    end
  end

  context 'ActiveRecord associations' do
    it 'has many events' do
      user = User.reflect_on_association(:created_events)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many attendees' do
      user = User.reflect_on_association(:invitations)
      expect(user.macro).to eq(:has_many)
    end
  end

  it 'has many attendees' do
    user = User.reflect_on_association(:attended_events)
    expect(user.macro).to eq(:has_many)
  end
end
