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

ActiveRecord::Schema.define(version: 20180814153456) do

  create_table "identities", force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "mainimages", force: :cascade do |t|
    t.text "image0", default: ""
    t.text "image1", default: ""
    t.text "image2", default: ""
    t.text "ver_name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maker_responses", force: :cascade do |t|
    t.integer "product_id"
    t.integer "maker_id"
    t.string "name"
    t.string "response_type", default: "무응답"
    t.text "response_text"
    t.integer "send_count"
    t.text "agree_hash"
    t.text "disagree_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maker_id"], name: "index_maker_responses_on_maker_id"
    t.index ["product_id"], name: "index_maker_responses_on_product_id"
  end

  create_table "makers", force: :cascade do |t|
    t.text "name"
    t.integer "num"
    t.text "assos"
    t.text "desc1"
    t.text "desc2"
    t.text "desc3"
    t.text "image0"
    t.text "image1"
    t.text "image2"
    t.text "email"
    t.text "email2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.integer "selled_count", default: 0
    t.integer "remain_count", default: 10000
    t.integer "product_id"
    t.integer "price", default: 0
    t.text "name"
    t.text "content"
    t.text "image0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_packages_on_product_id"
  end

  create_table "packages_product_options", id: false, force: :cascade do |t|
    t.integer "package_id", null: false
    t.integer "product_option_id", null: false
  end

  create_table "product_options", force: :cascade do |t|
    t.integer "product_id"
    t.text "name", default: ""
    t.text "content", default: ""
    t.integer "price", default: 0
    t.text "status", default: ""
    t.integer "selled_count", default: 0
    t.integer "remain_count", default: 0
    t.text "image0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image1"
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.text "subname", default: ""
    t.datetime "start_date", default: "2018-08-06 12:09:53", null: false
    t.datetime "end_date", default: "2018-09-05 12:09:53", null: false
    t.text "youtb_url", default: ""
    t.text "video_text", default: ""
    t.text "bill_url", default: ""
    t.text "image0", default: ""
    t.text "assos", default: ""
    t.text "fb_url", default: ""
    t.text "image1", default: ""
    t.text "content", default: ""
    t.integer "funded_money", default: 0
    t.integer "funded_count", default: 0
    t.text "status", default: ""
    t.text "category", default: ""
    t.integer "goal_money", default: 1000000
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bill_id"
    t.text "bill_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_img"
    t.string "name"
    t.text "address"
    t.text "phone_number"
    t.string "provider"
    t.string "uid"
    t.text "image"
    t.integer "address_num"
    t.text "address_text"
    t.text "address_extra"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
