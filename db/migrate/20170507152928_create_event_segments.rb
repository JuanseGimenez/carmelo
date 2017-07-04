class CreateEventSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :event_segments do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :trip, foreign_key: true
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false

      t.timestamps
    end
  end
end
