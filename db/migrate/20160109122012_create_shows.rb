class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :venue_id
      t.integer :performer_id

      t.timestamps null: false
    end
  end
end
