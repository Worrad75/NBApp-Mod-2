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

ActiveRecord::Schema.define(version: 2019_09_10_194614) do

  create_table "follows", force: :cascade do |t|
    t.integer "player_id"
    t.integer "user_id"
    t.boolean "favorite", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.datetime "date"
    t.integer "home_id"
    t.integer "home_score"
    t.integer "away_id"
    t.integer "away_score"
    t.boolean "postseason"
    t.integer "season_year"
  end

  create_table "players", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.string "position"
    t.integer "weight"
    t.integer "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "full_name"
    t.string "city"
    t.string "conference"
    t.string "division"
    t.string "abv"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
