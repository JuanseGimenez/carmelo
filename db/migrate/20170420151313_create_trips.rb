class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
