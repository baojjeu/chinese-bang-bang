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

ActiveRecord::Schema.define(version: 20141226022519) do

  create_table "examples", force: true do |t|
    t.string   "sentence"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_id"
  end

  add_index "examples", ["topic_id"], name: "index_examples_on_topic_id"

  create_table "hanyus", force: true do |t|
    t.string   "pinyin"
    t.integer  "pinyinable_id"
    t.string   "pinyinable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meaning"
  end

  create_table "topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
