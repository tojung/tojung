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

ActiveRecord::Schema.define(version: 20180516090325) do

  create_table "person_responses", force: :cascade do |t|
    t.text "name"
    t.integer "person_id"
    t.text "response_type"
    t.text "response_text"
    t.text "send_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "propose_id"
    t.text "agree_hash"
    t.text "disagree_hash"
  end

  create_table "vcandidates", force: :cascade do |t|
    t.integer "propose_id"
    t.integer "seller_id"
    t.integer "vuser_id"
    t.integer "vote_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "intro"
  end

  create_table "vcarts", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.text "package_name"
    t.integer "num"
    t.integer "addhoo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "package_id"
  end

  create_table "vcategoryimages", force: :cascade do |t|
    t.text "name"
    t.text "bg_category_name"
    t.text "sm_category_name"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vcodes", force: :cascade do |t|
    t.text "user_name"
    t.text "code_name"
    t.integer "user_id"
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vcomments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "vproduct_id"
    t.integer "propose_id"
  end

  create_table "vcommunities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "propose_id"
    t.text "title"
    t.text "content"
    t.integer "heart"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
  end

  create_table "vcontract_options", force: :cascade do |t|
    t.integer "base_option_id"
    t.text "option_name"
    t.integer "price"
    t.integer "user_id"
    t.integer "propose_id"
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vcontracts", force: :cascade do |t|
    t.integer "propose_id"
    t.text "title"
    t.text "content"
    t.integer "user_id"
    t.integer "contract_money"
    t.integer "real_pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "deadline"
  end

  create_table "vcontributors", force: :cascade do |t|
    t.integer "user_id"
    t.integer "propose_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vcoupons", force: :cascade do |t|
    t.text "name"
    t.integer "user_id"
    t.integer "serial"
    t.integer "total_amount"
    t.integer "remain_amount"
    t.text "will_expire_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vcposts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "community_id"
    t.integer "propose_id"
    t.text "title"
    t.text "content"
    t.integer "heart"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.integer "like"
  end

  create_table "vheartlogs", force: :cascade do |t|
    t.integer "propose_id"
    t.integer "user_id"
    t.integer "target_id"
    t.text "target_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vidents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vlikelogs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cpost_id"
    t.integer "community_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vmatches", force: :cascade do |t|
    t.integer "propose_id"
    t.integer "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "candidate_id"
  end

  create_table "vpackages", force: :cascade do |t|
    t.integer "product_id"
    t.text "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vpledges", force: :cascade do |t|
    t.text "content"
    t.integer "propose_id"
    t.integer "seller_id"
    t.integer "candidate_id"
    t.integer "user_id"
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vpointlogs", force: :cascade do |t|
    t.integer "amount"
    t.integer "user_id"
    t.text "category"
    t.boolean "plus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "propose_id"
  end

  create_table "vpoints", force: :cascade do |t|
    t.integer "amount"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "propose_id"
  end

  create_table "vproducts", force: :cascade do |t|
    t.integer "bill_id"
    t.integer "fake_price"
    t.integer "price"
    t.text "main_image_link"
    t.integer "total_buy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "title"
    t.text "intro"
    t.integer "deadline"
    t.integer "seller_id"
  end

  create_table "vproposes", force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.integer "user_id"
    t.integer "funded_money"
    t.integer "funded_num"
    t.integer "goal_money"
    t.text "bg_category_name"
    t.text "sm_category_name"
    t.text "image"
    t.text "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "deadline"
    t.datetime "deadlines"
    t.text "default_image"
    t.text "goods"
    t.text "campaign"
    t.text "campaign_content"
    t.text "bill_link"
    t.text "tumb"
    t.text "assos"
    t.text "goods2"
    t.text "goods3"
  end

  create_table "vrewards", force: :cascade do |t|
    t.integer "user_id"
    t.text "title"
    t.integer "amount"
    t.text "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vsellers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "account"
    t.text "account_assos"
    t.integer "user_id"
  end

  create_table "vtransactions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.integer "price"
    t.integer "total_amount"
    t.integer "num"
    t.integer "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "serial"
    t.integer "package_price"
    t.integer "package_num"
    t.integer "hoo"
    t.integer "user_account"
    t.text "baesong_name"
    t.text "baesong_addr"
    t.integer "baesong_addr_num"
    t.text "baesong_contact"
    t.text "payment_way"
    t.boolean "ispay"
    t.integer "received_amount"
    t.text "baesong_status"
    t.text "user_name"
    t.text "user_phone"
    t.text "user_email"
    t.integer "user_addr_num"
    t.text "payed_account"
    t.text "payed_name"
    t.integer "coupon_use"
    t.integer "coupon"
    t.text "user_accountt"
    t.integer "package_id"
  end

  create_table "vusers", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
    t.text "address"
    t.text "account"
    t.text "phone_number"
    t.text "account_assos"
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.integer "address_num"
    t.string "provider"
    t.string "uid"
    t.text "facebook_name"
    t.text "facebook_image"
    t.text "image"
    t.text "real_name"
    t.text "category"
    t.integer "seller_id"
    t.index ["email"], name: "index_vusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_vusers_on_reset_password_token", unique: true
  end

  create_table "vvotes", force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "propose_id"
  end

end
