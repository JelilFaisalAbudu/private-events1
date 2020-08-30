class Attendance < ApplicationRecord
  belongs_to :attendee, foreign_key: 'User'
  belongs_to :created_event
end
