class InitialModels < ActiveRecord::Migration[6.0]
    def change
      create_table :bikes do |t|
        t.string :title
        t.text :description
        t.string :category
        t.string :location
        t.date :start_date
        t.date :end_date
        t.boolean :active
        t.float :price_per_day
        t.timestamps
      end
  end
end
