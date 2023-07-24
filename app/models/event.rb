require "date"

class Event < ApplicationRecord

    validates :title, presence: true 
    validates :date, presence: true 
    validates :location, presence: true 

    belongs_to :creator, class_name: "User"
    has_many :event_guests, foreign_key: "attended_event_id", dependent: :destroy
    has_many :attendees, through: :event_guests, dependent: :destroy 

    scope :past, -> { where("date < ?", Date.current)}
    scope :future, -> { where("date >= ?", Date.current )}

    # def self.past 
    #     Event.where(:date < Date.current)
    # end 

    # def self.future 
    #     Event.where(:date >= Date.current)
    # end
end
