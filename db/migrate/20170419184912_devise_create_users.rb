class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :password,           null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Deactivable
      t.boolean :active, null:false, default: true
      t.datetime :deactivation_date

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      #Add Config to OmniAuth
      t.string   :provider
      t.string   :uid

      #Adds Facebook Information
      t.string :name
      t.string :facebook_image_url
      t.string :location
      t.string :phone_number
      t.string :facebook_url
      t.string :gender
      t.date :birthdate


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
