class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, uniqueness: true, presence: true 
  validates :username, uniqueness: true, presence: true

  has_many :creating_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
  has_many :event_guests, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :event_guests, dependent: :destroy

  def email_changed?
    false 
  end
end
