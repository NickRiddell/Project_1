class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :booking
      t.integer :value
      t.timestamps null: false
    end
  end
end
