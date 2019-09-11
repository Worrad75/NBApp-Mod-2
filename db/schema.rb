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

ActiveRecord::Schema.define(version: 2019_09_11_214514) do

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
    t.integer "api_id"
    t.integer "season_stage"
    t.string "arena"
  end

  create_table "players", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.float "weight"
    t.integer "team_id"
    t.float "height"
    t.string "collegeName"
    t.string "country"
  end

  create_table "statlines", force: :cascade do |t|
    t.integer "player_id"
    t.integer "game_id"
    t.integer "pts"
    t.integer "ast"
    t.integer "reb"
    t.integer "stl"
    t.integer "blk"
    t.integer "turnover"
    t.integer "pf"
    t.string "min"
    t.integer "dreb"
    t.integer "oreb"
    t.float "fg_pct"
    t.integer "fga"
    t.integer "fgm"
    t.float "fg3_pct"
    t.integer "fg3a"
    t.integer "fg3m"
    t.float "ft_pct"
    t.integer "fta"
    t.integer "ftm"
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
