class AddDistrictToBikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :bikes, :district, null: true, foreign_key: true
  end
end
