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

ActiveRecord::Schema.define(version: 2020_06_10_000503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "score"
    t.text "content"
    t.boolean "recommended"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_feedbacks_on_author_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "flags", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.index ["author_id"], name: "index_flags_on_author_id"
    t.index ["user_id"], name: "index_flags_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_user_interests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "interest_id"
    t.integer "intensity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interest_id"], name: "index_join_user_interests_on_interest_id"
    t.index ["user_id"], name: "index_join_user_interests_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "score"
    t.integer "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "match_user_id"
    t.index ["match_user_id"], name: "index_matches_on_match_user_id"
    t.index ["user_id"], name: "index_matches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "description"
    t.date "birthdate"
    t.bigint "job_id"
    t.bigint "city_id"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["job_id"], name: "index_users_on_job_id"
  end

  add_foreign_key "feedbacks", "users"
  add_foreign_key "flags", "users"
  add_foreign_key "join_user_interests", "interests"
  add_foreign_key "join_user_interests", "users"
  add_foreign_key "matches", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "jobs"
end
