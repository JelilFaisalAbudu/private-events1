require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'ActiveRecord association' do
    it 'belons to attendee' do
      invitation = Invitation.reflect_on_association(:attendee)
      expect(invitation.macro).to eq(:belongs_to)
    end

    it 'belons to created event' do
      invitation = Invitation.reflect_on_association(:created_event)
      expect(invitation.macro).to eq(:belongs_to)
    end
  end
end
