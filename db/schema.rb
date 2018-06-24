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

ActiveRecord::Schema.define(version: 2018_06_24_124000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.string "dietary"
    t.boolean "attending", default: false, null: false
    t.boolean "name_updatable", default: false, null: false
    t.integer "rsvp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id", "rsvp_id"], name: "index_guests_on_id_and_rsvp_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.string "name"
    t.string "dietary"
    t.string "access_key"
    t.boolean "attending", default: false, null: false
    t.integer "number_of_guests", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_key"], name: "index_rsvps_on_access_key"
  end

end
