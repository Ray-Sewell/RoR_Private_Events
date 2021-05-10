class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"

    has_many :event_attendees
    has_many :attendees, through: :event_attendees, source: :attendee

    validates :name, presence: true, length: {minimum: 4, maximum: 60}
    validates :location, presence: true, length: {minimum: 4, maximum: 50}
    validates :time, presence: true, uniqueness: true
    validates :description, presence: true, length: {minimum: 4, maximum: 200}
end
