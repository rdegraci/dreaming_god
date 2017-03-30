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

ActiveRecord::Schema.define(version: 20170330042636) do

  create_table "db_people", force: :cascade do |t|
    t.string   "label"
    t.integer  "age"
    t.integer  "height"
    t.string   "hair_color"
    t.string   "eye_color"
    t.boolean  "alive"
    t.float    "weight"
    t.float    "mass"
    t.string   "gender"
    t.text     "description"
    t.string   "people_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "db_places", force: :cascade do |t|
    t.string   "label"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "zip_code"
    t.string   "street_number"
    t.string   "street"
    t.float    "area"
    t.boolean  "earth"
    t.boolean  "space"
    t.string   "country"
    t.string   "state"
    t.integer  "north"
    t.integer  "south"
    t.integer  "east"
    t.integer  "west"
    t.integer  "up"
    t.integer  "down"
    t.text     "description"
    t.string   "place_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "db_sessions", force: :cascade do |t|
    t.string   "sessionId"
    t.string   "userId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "db_things", force: :cascade do |t|
    t.string   "label"
    t.float    "mass"
    t.boolean  "edible"
    t.boolean  "visible"
    t.boolean  "wearable"
    t.boolean  "container"
    t.boolean  "containable"
    t.boolean  "transportable"
    t.boolean  "transport"
    t.boolean  "platform"
    t.boolean  "platformable"
    t.boolean  "damageable"
    t.boolean  "damager"
    t.integer  "cost"
    t.boolean  "takeable"
    t.boolean  "dropable"
    t.text     "description"
    t.string   "thing_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
