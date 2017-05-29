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

ActiveRecord::Schema.define(version: 20170529015602) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "intro",          limit: 65535
    t.integer  "traffic"
    t.datetime "start_time"
    t.datetime "terminate_time"
    t.integer  "shop_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["shop_id"], name: "index_activities_on_shop_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "origin"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "shop_id"
    t.string   "url"
    t.index ["shop_id"], name: "index_cards_on_shop_id", using: :btree
  end

  create_table "coupons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "serial_number"
    t.integer  "activity_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["activity_id"], name: "index_coupons_on_activity_id", using: :btree
    t.index ["user_id"], name: "index_coupons_on_user_id", using: :btree
  end

  create_table "photographs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "intro",              limit: 65535
    t.text     "manifesto",          limit: 65535
    t.integer  "vote_numbers"
    t.integer  "activity_id"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["activity_id"], name: "index_photographs_on_activity_id", using: :btree
    t.index ["user_id"], name: "index_photographs_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "photograph_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["photograph_id"], name: "index_photos_on_photograph_id", using: :btree
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "intro",             limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  limit: 128, default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token",   limit: 128
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 128
    t.string   "last_sign_in_ip",        limit: 128
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 128,                           collation: "utf8mb4_general_ci"
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname",               limit: 128,                           collation: "utf8mb4_general_ci"
    t.integer  "gender"
    t.string   "avatar"
    t.string   "province"
    t.string   "city"
    t.string   "country"
    t.integer  "card_status"
    t.string   "phone"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "photograph_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["photograph_id"], name: "index_votes_on_photograph_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  add_foreign_key "activities", "shops"
  add_foreign_key "cards", "shops"
  add_foreign_key "coupons", "activities"
  add_foreign_key "coupons", "users"
  add_foreign_key "photographs", "activities"
  add_foreign_key "photographs", "users"
  add_foreign_key "photos", "photographs"
  add_foreign_key "votes", "photographs"
  add_foreign_key "votes", "users"
end
