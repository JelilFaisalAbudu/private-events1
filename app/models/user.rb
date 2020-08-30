class User < ApplicationRecord
  before_save do
    self.email = email.downcase
    self.username = username.capitalize
  end
  has_many :created_events, foreign_key: :creator_id, class_name: 'Event'
  has_many :attendances, foreign_key: :attendee_id
  has_many :attended_events, through: :attendances, source: :organized_event

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :username, presence: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  # scope :my_organized_events, -> { where('organizser_id == ?', current_user.id) }
  # scope :my_attended_events, -> { where('attendee_id == ?', current_user.id) }
end
