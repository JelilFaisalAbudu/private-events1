class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
