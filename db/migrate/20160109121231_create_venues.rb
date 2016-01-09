class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :location

      t.timestamps null: false
    end
  end
end
