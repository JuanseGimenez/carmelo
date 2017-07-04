class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :model, null: false
      t.string :name, null: false
      t.integer :year, null: false
      t.integer :places, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
