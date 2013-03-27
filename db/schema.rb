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

ActiveRecord::Schema.define(:version => 20130327201715) do

  create_table "cash_balances", :force => true do |t|
    t.decimal  "cash"
    t.decimal  "extraction"
    t.datetime "date"
    t.integer  "checkout_id"
    t.integer  "store_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "bill200"
    t.integer  "bill100"
    t.integer  "bill50"
    t.integer  "bill20"
    t.integer  "bill10"
    t.integer  "bill5"
    t.integer  "bill2"
    t.integer  "bill1"
    t.integer  "bill0_50"
    t.integer  "bill0_20"
    t.integer  "bill0_10"
    t.integer  "bill0_05"
    t.integer  "bill0_02"
    t.integer  "bill0_01"
    t.integer  "ex_bill200"
    t.integer  "ex_bill100"
    t.integer  "ex_bill50"
    t.integer  "ex_bill20"
    t.integer  "ex_bill10"
    t.integer  "ex_bill5"
    t.integer  "ex_bill2"
    t.integer  "ex_bill1"
    t.integer  "ex_bill0_50"
    t.integer  "ex_bill0_20"
    t.integer  "ex_bill0_10"
    t.integer  "ex_bill0_05"
    t.integer  "ex_bill0_02"
    t.integer  "ex_bill0_01"
  end

  create_table "checkouts", :force => true do |t|
    t.datetime "date"
    t.integer  "store_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
    t.boolean  "finished",   :default => false, :null => false
  end

  create_table "daily_sales", :force => true do |t|
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "store_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.boolean  "capture",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "receipts", :force => true do |t|
    t.text     "text"
    t.decimal  "value"
    t.integer  "user_id"
    t.integer  "store_id"
    t.integer  "checkout_id"
    t.datetime "date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sales", :force => true do |t|
    t.datetime "date"
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "store_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "product_id"
    t.integer  "checkout_id"
  end

  create_table "shifts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "start"
    t.datetime "stop"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "store_id"
  end

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => ""
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.boolean  "admin",                  :default => false, :null => false
    t.boolean  "time_tracking",          :default => false, :null => false
    t.boolean  "checkout_rights",        :default => false, :null => false
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "z_bons", :force => true do |t|
    t.decimal  "sale19"
    t.decimal  "sale7"
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "store_id"
    t.integer  "checkout_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
