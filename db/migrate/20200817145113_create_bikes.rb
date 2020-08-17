class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :location, :default => "Berlin"
      t.time :starting_date
      t.time :end_time
      t.boolean :active, :default => true
      #Ex:- :default =>''
      t.integer :price_per_day
      t.timestamps
    end
  end
end
