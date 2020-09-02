require 'rails_helper'
RSpec.describe Event, type: :model do
  user = User.create(username: 'ExampleUser', email: 'user@example.com.com')
  event = user.created_events.create!(
    title: 'My Event Title',
    date: Date.new(2020, 10, 23),
    description: 'Event desc',
  )
  
  context 'Event creation and validation' do
    it 'should return true (Event fulfil all the requirements)' do
      expect(event).to be_valid
    end

    it 'should return true (event without a date)' do
      event.date = nil
      expect(event).to_not be_valid
    end

    it 'should return true (event without a title)' do
      event.title = nil
      expect(event).to_not be_valid
    end

    it 'should return true (event without a description)' do
      event.description = nil
      expect(event).to_not be_valid
    end

    it 'should return true (event with a small description)' do
      event.description = '1'
      expect(event).to_not be_valid
    end

    it 'should return true (event without a creator)' do
      event.creator_id = nil
      expect(event).to_not be_valid
    end
  end
  context 'associations' do
    it 'should have a creator assossiated' do
      expect(event).to respond_to(:creator)
    end

    it 'should have many invitations' do
      expect(event).to respond_to(:invitations)
    end

    it 'should have many attendes' do
      expect(event).to respond_to(:attendees)
    end
  end
end
