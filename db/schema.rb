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

ActiveRecord::Schema.define(version: 20160606092804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "layout"
    t.string   "image_name"
    t.boolean  "online"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercices", force: :cascade do |t|
    t.integer  "number"
    t.integer  "level"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "exercices", ["article_id"], name: "index_exercices_on_article_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "remarks", force: :cascade do |t|
    t.string   "title"
    t.integer  "category"
    t.integer  "writing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "remarks", ["writing_id"], name: "index_remarks_on_writing_id", using: :btree

  create_table "writings", force: :cascade do |t|
    t.integer  "abs_lvl"
    t.integer  "rel_lvl"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "writings", ["article_id"], name: "index_writings_on_article_id", using: :btree

  add_foreign_key "exercices", "articles"
  add_foreign_key "remarks", "writings"
  add_foreign_key "writings", "articles"
end
