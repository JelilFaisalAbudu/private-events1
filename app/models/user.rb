class User < ApplicationRecord
	before_save do
		self.email = self.email.downcase
		self.username = self.username.capitalize
	end
	has_many :organized_events, foreign_key: :organizer_id, class_name: 'Event'
	has_many :attendances, foreign_key: :attendee_id
	has_many :attended_events, through: :attendances, source: :organized_event

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :username, presence: true
	validates :email, presence: true, length: { maximum: 255 },
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: true
	
	# scope :my_organized_events, -> { where('organizser_id == ?', current_user.id) }
	# scope :my_attended_events, -> { where('attendee_id == ?', current_user.id) }
end
