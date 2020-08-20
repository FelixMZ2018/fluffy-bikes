class Bike < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    has_one_attached  :photo
    belongs_to :district, foreign_key: "district_id"
end
