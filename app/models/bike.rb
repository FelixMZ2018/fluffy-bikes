class Bike < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    has_one_attached  :photo
  #  belongs_to :district, foreign_key: "district_id"  >> DO NOT ENABLE THIS LINE IT WILL BREAK THINGS 
    geocoded_by :address
    after_validation :geocode,# if: :will_save_change_to_address? HOTFX
    include PgSearch::Model
    pg_search_scope :search_by_title_and_description,
      against: [ :title, :description ],
      using: {
        tsearch: { prefix: true }
    }
end
