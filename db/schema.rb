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

ActiveRecord::Schema.define(version: 20150923201908) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "countries", ["region_id"], name: "index_countries_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spots", force: :cascade do |t|
    t.string   "name"
    t.string   "wave_quality"
    t.string   "experience_level"
    t.string   "frequency"
    t.string   "break_type"
    t.string   "direction"
    t.string   "sea_floor"
    t.string   "power"
    t.string   "usual_length"
    t.string   "epic_length"
    t.string   "ideal_swell_direction"
    t.string   "ideal_wind_direction"
    t.string   "swell_size"
    t.string   "ideal_tide"
    t.string   "ideal_tide_movement"
    t.string   "weekday_crowd"
    t.string   "weekend_crowd"
    t.string   "dangers"
    t.decimal  "latitude",              precision: 10, scale: 6
    t.decimal  "longitude",             precision: 10, scale: 6
    t.integer  "sub_zone_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "spots", ["sub_zone_id"], name: "index_spots_on_sub_zone_id", using: :btree

  create_table "sub_zones", force: :cascade do |t|
    t.string   "name"
    t.integer  "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sub_zones", ["zone_id"], name: "index_sub_zones_on_zone_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "provider"
    t.string   "token"
    t.string   "uid"
    t.string   "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "zones", ["country_id"], name: "index_zones_on_country_id", using: :btree

  add_foreign_key "countries", "regions"
  add_foreign_key "spots", "sub_zones"
  add_foreign_key "sub_zones", "zones"
  add_foreign_key "zones", "countries"
end
