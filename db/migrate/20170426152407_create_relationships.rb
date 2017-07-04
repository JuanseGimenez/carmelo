class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :subscriber_id
      t.integer :trip_id

      t.timestamps
    end
    add_index :relationships, :subscriber_id
    add_index :relationships, :trip_id
    add_index :relationships, [:subscriber_id, :trip_id], unique: true
  end
end
