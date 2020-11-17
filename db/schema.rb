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

ActiveRecord::Schema.define(version: 2020_09_03_114913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.integer "depth"
    t.boolean "doublep"
    t.string "team"
    t.boolean "injured"
    t.string "formation"
    t.integer "bye"
    t.string "notes"
    t.float "gfanpts"
    t.float "gyds_pass"
    t.float "gtds_pass"
    t.float "grec_rec"
    t.float "gyds_rec"
    t.float "gtds_rec"
    t.float "gatt_rush"
    t.float "gyds_rush"
    t.float "gtds_rush"
    t.integer "yfanpts"
    t.integer "yyds_pass"
    t.integer "ytds_pass"
    t.integer "yrec_rec"
    t.integer "yyds_rec"
    t.integer "ytds_rec"
    t.integer "yatt_rush"
    t.integer "yyds_rush"
    t.integer "ytds_rush"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tier"
    t.integer "rank"
    t.float "adp"
  end

end
