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

ActiveRecord::Schema.define(version: 20160116145334) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter",  limit: 255
    t.text     "body",       limit: 65535
    t.integer  "article_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
    t.datetime "last_reserv_date"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "location",         limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "rows", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "x_coord",    limit: 4
    t.integer  "y_coord",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "seatmap_id", limit: 4
  end

  add_index "rows", ["seatmap_id"], name: "index_rows_on_seatmap_id", using: :btree

  create_table "seatmaps", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "event_id",   limit: 4
  end

  add_index "seatmaps", ["event_id"], name: "index_seatmaps_on_event_id", using: :btree

  create_table "seats", force: :cascade do |t|
    t.integer  "number",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "row_id",     limit: 4
    t.string   "state",      limit: 255
  end

  add_index "seats", ["row_id"], name: "index_seats_on_row_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "price",      limit: 4
    t.string   "type",       limit: 255
    t.boolean  "paid",       limit: 1
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "username",               limit: 255
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.string   "first_name",             limit: 255
    t.string   "surname",                limit: 255
    t.integer  "social_security_number", limit: 8
    t.string   "phone_number",           limit: 255
    t.integer  "postal_code",            limit: 4
    t.string   "postal_address",         limit: 255
    t.string   "address",                limit: 255
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "articles"
  add_foreign_key "rows", "seatmaps"
  add_foreign_key "seatmaps", "events"
  add_foreign_key "seats", "rows"
  add_foreign_key "tickets", "users"
end
