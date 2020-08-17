class AddingReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :bikes, :user,index: true
    add_reference :bookings, :bike, index: true
    add_reference :bookings, :user, index: true
  end
end
