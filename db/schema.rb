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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120810174805) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.float    "price"
    t.integer  "quantity"
    t.integer  "reference_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "books", ["reference_id"], :name => "index_books_on_reference_id", :unique => true

  create_table "discounts", :force => true do |t|
    t.boolean  "active"
    t.float    "price"
    t.integer  "percent_off"
    t.string   "note"
    t.integer  "discountable_id"
    t.string   "discountable_type"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "brand"
    t.string   "model"
    t.float    "price"
    t.integer  "kind"
    t.integer  "quantity"
    t.integer  "reference_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "items", ["reference_id"], :name => "index_items_on_reference_id", :unique => true

  create_table "music_boxes", :force => true do |t|
    t.string   "title"
    t.string   "artist"
    t.integer  "format"
    t.float    "price"
    t.string   "label"
    t.integer  "quantity",     :default => 0
    t.integer  "kind"
    t.integer  "reference_id",                :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "music_boxes", ["reference_id"], :name => "index_music_boxes_on_reference_id", :unique => true

  create_table "pictures", :force => true do |t|
    t.string   "caption"
    t.string   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "pre_sales", :force => true do |t|
    t.string   "event"
    t.datetime "date"
    t.float    "price"
    t.string   "description"
    t.integer  "quantity"
    t.integer  "reference_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "pre_sales", ["reference_id"], :name => "index_pre_sales_on_reference_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.integer  "permissions"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
