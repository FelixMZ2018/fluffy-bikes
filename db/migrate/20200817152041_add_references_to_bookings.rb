class AddReferencesToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :user, index: true
    add_reference :bookings, :bike, index: true
  end
end
