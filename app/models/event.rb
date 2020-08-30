class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: :created_event_id

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
