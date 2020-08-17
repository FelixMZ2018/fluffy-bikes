class Booking < ApplicationRecord
    belongs_to :bike, foreign_key: "bike_id"
    belongs_to :user, foreign_key: "user_id"
end
