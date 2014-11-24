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

ActiveRecord::Schema.define(version: 20141123042203) do

  create_table "places", force: true do |t|
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.text     "address"
    t.integer  "shop_kind"
    t.integer  "locational"
    t.integer  "other"
    t.integer  "time"
    t.integer  "time2"
    t.integer  "youbi_all"
    t.integer  "sunday"
    t.integer  "monday"
    t.integer  "tuesday"
    t.integer  "wednesday"
    t.integer  "thursday"
    t.integer  "friday"
    t.integer  "saturday"
    t.integer  "house_rent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "all"
    t.integer  "kitchen"
    t.integer  "hall"
    t.integer  "counter"
    t.integer  "fryer"
    t.integer  "gas_stove"
    t.integer  "range"
    t.integer  "refrigerator"
    t.integer  "dishwashers"
    t.integer  "worktop"
    t.integer  "sink"
    t.string   "image"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phonenumber"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
