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

ActiveRecord::Schema.define(version: 20141224215932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string  "title"
    t.string  "articleId"
    t.text    "content",                               array: true
    t.integer "cached_votes_total",      default: 0
    t.integer "cached_votes_score",      default: 0
    t.integer "cached_votes_up",         default: 0
    t.integer "cached_votes_down",       default: 0
    t.integer "cached_weighted_score",   default: 0
    t.integer "cached_weighted_total",   default: 0
    t.float   "cached_weighted_average", default: 0.0
    t.string  "link"
    t.string  "external_link",           default: ""
  end

  add_index "articles", ["cached_votes_down"], name: "index_articles_on_cached_votes_down", using: :btree
  add_index "articles", ["cached_votes_score"], name: "index_articles_on_cached_votes_score", using: :btree
  add_index "articles", ["cached_votes_total"], name: "index_articles_on_cached_votes_total", using: :btree
  add_index "articles", ["cached_votes_up"], name: "index_articles_on_cached_votes_up", using: :btree
  add_index "articles", ["cached_weighted_average"], name: "index_articles_on_cached_weighted_average", using: :btree
  add_index "articles", ["cached_weighted_score"], name: "index_articles_on_cached_weighted_score", using: :btree
  add_index "articles", ["cached_weighted_total"], name: "index_articles_on_cached_weighted_total", using: :btree

  create_table "links", force: true do |t|
    t.string   "article_title"
    t.string   "website_title"
    t.date     "date_accessed"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["user_id", "created_at"], name: "index_links_on_user_id_and_created_at", using: :btree
  add_index "links", ["user_id"], name: "index_links_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
