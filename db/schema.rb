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

ActiveRecord::Schema.define(version: 20160227163756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.string   "role_name"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "buildings", ["institution_id"], name: "index_buildings_on_institution_id", using: :btree

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.boolean  "archived",      default: false
    t.integer  "building_id"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "orders", ["building_id"], name: "index_orders_on_building_id", using: :btree
  add_index "orders", ["created_by_id"], name: "index_orders_on_created_by_id", using: :btree
  add_index "orders", ["updated_by_id"], name: "index_orders_on_updated_by_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                            null: false
    t.string   "email",                               null: false
    t.string   "full_name"
    t.string   "crypted_password",                    null: false
    t.string   "password_salt",                       null: false
    t.string   "persistence_token",                   null: false
    t.string   "single_access_token",                 null: false
    t.string   "perishable_token",                    null: false
    t.integer  "login_count",         default: 0,     null: false
    t.integer  "failed_login_count",  default: 0,     null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.boolean  "verified",            default: false
    t.string   "role"
  end

  add_foreign_key "buildings", "institutions"
  add_foreign_key "orders", "buildings"
end
