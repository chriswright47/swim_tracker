# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141225222831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: true do |t|
    t.string   "first_name",                    null: false
    t.string   "last_name",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender"
    t.string   "status",     default: "active", null: false
  end

  create_table "events", force: true do |t|
    t.string   "stroke"
    t.integer  "distance"
    t.boolean  "relay",      default: false, null: false
    t.string   "gender"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "heats", force: true do |t|
    t.integer  "meet_id"
    t.integer  "event_id"
    t.integer  "entry_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "heats", ["event_id"], name: "index_heats_on_event_id", using: :btree
  add_index "heats", ["meet_id"], name: "index_heats_on_meet_id", using: :btree

  create_table "meets", force: true do |t|
    t.string   "opponent"
    t.date     "competition_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "swims", force: true do |t|
    t.integer  "athlete_id"
    t.integer  "heat_id"
    t.boolean  "relay_start"
    t.integer  "final_time_ms"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "swims", ["athlete_id"], name: "index_swims_on_athlete_id", using: :btree
  add_index "swims", ["heat_id"], name: "index_swims_on_heat_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",         null: false
    t.string   "password_hash", null: false
    t.string   "password_salt", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
