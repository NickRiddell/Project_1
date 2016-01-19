class CreatePerformerships < ActiveRecord::Migration
  def change
    create_table :performerships do |t|
      t.integer :show_id
      t.integer :performer_id

      t.timestamps null: false
    end
  end
end
