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

ActiveRecord::Schema.define(version: 2019_11_03_215034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uid"
    t.string "provider"
    t.string "name"
    t.string "email"
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["work_id"], name: "index_votes_on_work_id"
  end

  create_table "works", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "creator"
    t.string "description"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vote_count", default: 0
    t.integer "publication_year"
  end

  add_foreign_key "votes", "users"
  add_foreign_key "votes", "works"
end
