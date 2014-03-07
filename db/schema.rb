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

ActiveRecord::Schema.define(version: 20140307034901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string  "attribution_text"
    t.string  "attribution_url"
    t.string  "name",                         null: false
    t.integer "price",            default: 0, null: false
    t.text    "src",                          null: false
  end

  create_table "treasure_shelves", force: true do |t|
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treasure_shelves", ["customer_id"], name: "index_treasure_shelves_on_customer_id", using: :btree

  create_table "treasures", force: true do |t|
    t.integer "treasure_shelf_id",             null: false
    t.integer "product_id",                    null: false
    t.integer "purchase_price",    default: 0, null: false
  end

  add_index "treasures", ["product_id"], name: "index_treasures_on_product_id", using: :btree
  add_index "treasures", ["treasure_shelf_id"], name: "index_treasures_on_treasure_shelf_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",      null: false
    t.string   "name",       null: false
    t.integer  "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
