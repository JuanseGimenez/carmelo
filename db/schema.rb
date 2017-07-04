# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170510152928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_segments", force: :cascade do |t|
    t.integer  "car_id"
    t.integer  "trip_id"
    t.string   "name",        null: false
    t.text     "description", null: false
    t.string   "origin",      null: false
    t.string   "destination", null: false
    t.datetime "start_date",  null: false
    t.datetime "end_date",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["car_id"], name: "index_car_segments_on_car_id", using: :btree
    t.index ["trip_id"], name: "index_car_segments_on_trip_id", using: :btree
  end

  create_table "cars", force: :cascade do |t|
    t.string   "model",      null: false
    t.string   "name",       null: false
    t.integer  "year",       null: false
    t.integer  "places",     null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id", using: :btree
  end

  create_table "event_segments", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.integer  "trip_id"
    t.datetime "start_date",  null: false
    t.datetime "end_date",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["trip_id"], name: "index_event_segments_on_trip_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "friend_id",  null: false
    t.boolean  "confirmed",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
    t.index ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_friendships_on_user_id", using: :btree
  end

  create_table "hotel_segments", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.string   "direction",   null: false
    t.integer  "trip_id"
    t.datetime "start_date",  null: false
    t.datetime "end_date",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["trip_id"], name: "index_hotel_segments_on_trip_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_posts_on_trip_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "subscriber_id"
    t.integer  "trip_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["subscriber_id", "trip_id"], name: "index_relationships_on_subscriber_id_and_trip_id", unique: true, using: :btree
    t.index ["subscriber_id"], name: "index_relationships_on_subscriber_id", using: :btree
    t.index ["trip_id"], name: "index_relationships_on_trip_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "start_date", null: false
    t.datetime "end_date",   null: false
    t.string   "name",       null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trips_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "password",               default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean  "active",                 default: true, null: false
    t.datetime "deactivation_date"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "facebook_image_url"
    t.string   "location"
    t.string   "phone_number"
    t.string   "facebook_url"
    t.string   "gender"
    t.date     "birthdate"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "car_segments", "cars"
  add_foreign_key "car_segments", "trips"
  add_foreign_key "cars", "users"
  add_foreign_key "event_segments", "trips"
  add_foreign_key "hotel_segments", "trips"
  add_foreign_key "posts", "trips"
  add_foreign_key "posts", "users"
  add_foreign_key "trips", "users"
end
