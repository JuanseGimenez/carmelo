class CreateCarSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :car_segments do |t|
      t.references :car, foreign_key: true
      t.references :trip, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false
      t.string :origin, null: false
      t.string :destination, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false

      t.timestamps
    end
  end
end
