class InitialModelsBookings < ActiveRecord::Migration[6.0]
    def change
      create_table :bookings do |t|
        t.date :starting_date
        t.date :end_date
        t.string :confirmation_status        
      end
  end
end
