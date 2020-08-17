class Bike < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    has_many :bookings
    validates :title, presence: true
    validates :category, presence: true
    validates :location, presence: true
    validates :active, presence: true
end
