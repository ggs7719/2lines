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

ActiveRecord::Schema.define(version: 20160717073128) do

  create_table "moods", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title"
    t.string   "content"
    t.datetime "date"
    t.boolean  "status",     default: false
    t.integer  "mother_id"
    t.integer  "father_id"
    t.integer  "count",      default: 0
    t.string   "message"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title"
    t.string   "content"
    t.datetime "date"
    t.boolean  "status",     default: false
    t.integer  "mother_id"
    t.integer  "father_id"
  end

  create_table "parents", force: :cascade do |t|
    t.integer  "mother_id"
    t.integer  "father_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prenatals", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title"
    t.string   "content"
    t.datetime "date"
    t.boolean  "status",     default: false
    t.integer  "mother_id"
    t.integer  "father_id"
    t.integer  "count",      default: 0
    t.string   "message"
  end

  create_table "psychos", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title"
    t.string   "content"
    t.datetime "date"
    t.boolean  "status",     default: false
    t.integer  "mother_id"
    t.integer  "father_id"
    t.integer  "count",      default: 0
    t.string   "message"
  end

  create_table "quests", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title"
    t.string   "content"
    t.datetime "date"
    t.boolean  "status",     default: false
    t.integer  "mother_id"
    t.integer  "father_id"
    t.boolean  "done",       default: false
    t.integer  "count",      default: 0
    t.string   "message"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fb_uid"
    t.string   "fb_token"
    t.string   "nick_name"
    t.string   "sexuality"
    t.date     "due_date"
    t.string   "ios_token"
  end

  add_index "users", ["due_date"], name: "index_users_on_due_date"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["fb_uid"], name: "index_users_on_fb_uid"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
