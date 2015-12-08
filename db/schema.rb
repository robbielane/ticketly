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

ActiveRecord::Schema.define(version: 20151207202039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location_city"
    t.string   "location_state"
    t.string   "venue"
    t.datetime "date_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "category_id"
  end

  add_index "events", ["category_id"], name: "index_events_on_category_id", using: :btree

  create_table "order_tickets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
    t.integer  "ticket_id"
  end

  add_index "order_tickets", ["order_id"], name: "index_order_tickets_on_order_id", using: :btree
  add_index "order_tickets", ["ticket_id"], name: "index_order_tickets_on_ticket_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status",     default: "Pending"
    t.integer  "total"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "vendor_id"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree
  add_index "orders", ["vendor_id"], name: "index_orders_on_vendor_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "price"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "section"
    t.string   "row"
    t.string   "seat"
    t.integer  "status",     default: 0
    t.integer  "event_id"
    t.integer  "vendor_id"
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id", using: :btree
  add_index "tickets", ["vendor_id"], name: "index_tickets_on_vendor_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "role",               default: 0
    t.string   "email"
    t.integer  "vendor_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "users", ["vendor_id"], name: "index_users_on_vendor_id", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.integer  "status",     default: 0
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "vendors", ["user_id"], name: "index_vendors_on_user_id", using: :btree

  add_foreign_key "events", "categories"
  add_foreign_key "order_tickets", "orders"
  add_foreign_key "order_tickets", "tickets"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "vendors"
  add_foreign_key "tickets", "events"
  add_foreign_key "tickets", "vendors"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users", "vendors"
  add_foreign_key "vendors", "users"
end
