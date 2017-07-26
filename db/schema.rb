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

ActiveRecord::Schema.define(version: 20170522230841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "instructor"
    t.string   "description"
    t.datetime "date"
    t.interval "duration"
    t.boolean  "repeats"
    t.integer  "gym_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["gym_id"], name: "index_events_on_gym_id", using: :btree
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "registered_on"
    t.boolean  "checked_in"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "rank"
    t.integer "user_id"
    t.integer "gym_id"
    t.index ["gym_id"], name: "index_favorites_on_gym_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "friendships", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_user_id"
    t.index ["friend_user_id", "user_id"], name: "index_friendships_on_friend_user_id_and_user_id", unique: true, using: :btree
    t.index ["user_id", "friend_user_id"], name: "index_friendships_on_user_id_and_friend_user_id", unique: true, using: :btree
  end

  create_table "gyms", force: :cascade do |t|
    t.string   "gym_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_gyms_on_user_id", using: :btree
  end

  create_table "gyms_activities", force: :cascade do |t|
    t.integer "gym_id"
    t.integer "activity_id"
  end

  create_table "ledger_entries", force: :cascade do |t|
    t.datetime "date"
    t.money    "debit",      scale: 2, default: "0.0", null: false
    t.money    "credit",     scale: 2, default: "0.0", null: false
    t.string   "memo"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["user_id"], name: "index_ledger_entries_on_user_id", using: :btree
  end

  create_table "memberships", id: false, force: :cascade do |t|
    t.integer "gym_id"
    t.integer "subscription_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comments"
    t.boolean  "moderated"
    t.integer  "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gym_id"], name: "index_ratings_on_gym_id", using: :btree
  end

  create_table "recurrences", force: :cascade do |t|
    t.datetime "repeat_start"
    t.datetime "repeat_end"
    t.datetime "repeat_until"
    t.string   "interval"
    t.string   "year"
    t.string   "month"
    t.string   "day"
    t.string   "week"
    t.string   "weekday"
    t.integer  "event_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["event_id"], name: "index_recurrences_on_event_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "interval"
    t.date     "next_renewal"
    t.money    "credits",      scale: 2
    t.money    "price",        scale: 2
    t.boolean  "active"
    t.integer  "gyms_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["gyms_id"], name: "index_subscriptions_on_gyms_id", using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "authentication_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.date     "dob"
    t.string   "address"
    t.string   "avatar_link"
    t.boolean  "is_gym",                 default: false
    t.integer  "gym_id"
    t.integer  "friend_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["friend_id"], name: "index_users_on_friend_id", using: :btree
    t.index ["gym_id"], name: "index_users_on_gym_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_activities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_id"
  end

end
