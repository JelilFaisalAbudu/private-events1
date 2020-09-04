class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :created_event_id, dependent: :destroy
  has_many :attendees, through: :invitations, source: :attendee, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true

  scope :upcoming_events, -> { where('date >= ?', Time.zone.now) }
  scope :previous_events, -> { where('date < ?', Time.zone.now) }
end
