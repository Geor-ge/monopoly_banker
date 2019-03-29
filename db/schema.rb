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

ActiveRecord::Schema.define(version: 2019_03_28_224455) do

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "piece"
    t.integer "cash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "property_price"
    t.integer "house_price"
    t.integer "hotel_price"
    t.integer "mortgage_value"
    t.integer "rent"
    t.integer "rent_1"
    t.integer "rent_2"
    t.integer "rent_3"
    t.integer "rent_4"
    t.integer "rent_hotel"
    t.boolean "owned"
    t.boolean "utility"
    t.boolean "railroad"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_properties_on_player_id"
  end

end
