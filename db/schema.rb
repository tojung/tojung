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

ActiveRecord::Schema.define(version: 20190408125109) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "authentication_tokens", force: :cascade do |t|
    t.string "body"
    t.integer "user_id"
    t.datetime "last_used_at"
    t.integer "expires_in"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body"], name: "index_authentication_tokens_on_body"
    t.index ["user_id"], name: "index_authentication_tokens_on_user_id"
  end

  create_table "best_bills", force: :cascade do |t|
    t.string "category"
    t.text "title"
    t.text "content"
    t.string "footchair_name"
    t.text "problems_content"
    t.text "image_0"
    t.integer "delay_time"
    t.integer "sangjung_time"
    t.integer "conference_time"
    t.text "review_doc"
    t.text "conference_doc"
    t.text "assos"
    t.text "editor_name"
    t.text "designer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image1"
    t.boolean "main"
    t.datetime "bill_start"
    t.integer "bill_id"
    t.datetime "sangjung_date"
  end

  create_table "bill_comments", force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.integer "best_bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_lists", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "mainimages", force: :cascade do |t|
    t.text "image0"
    t.text "image1"
    t.text "image2"
    t.text "ver_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image3"
    t.text "image4"
    t.string "md_link0"
    t.string "md_link1"
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

  create_table "notices", force: :cascade do |t|
    t.text "name"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "endpoint"
    t.string "p256h"
    t.string "auth"
    t.text "ip"
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
    t.string "phone"
    t.integer "delivery_price"
    t.boolean "hard_only"
    t.index ["product_id"], name: "index_packages_on_product_id"
  end

  create_table "packages_product_options", id: false, force: :cascade do |t|
    t.integer "package_id", null: false
    t.integer "product_option_id", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "imp_uid"
    t.string "pg_provider"
    t.integer "amount"
    t.string "name"
    t.string "pay_method"
    t.boolean "permission"
    t.boolean "validation"
    t.string "status"
    t.string "receipt_url"
    t.string "merchant_uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_caro_images", force: :cascade do |t|
    t.integer "product_id"
    t.text "image"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_deliveries", force: :cascade do |t|
    t.integer "product_order_id"
    t.integer "product_id"
    t.integer "package_id"
    t.string "status", default: "준비중"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_order_detail_id"
    t.index ["package_id"], name: "index_product_deliveries_on_package_id"
    t.index ["product_id"], name: "index_product_deliveries_on_product_id"
    t.index ["product_order_detail_id"], name: "index_product_deliveries_on_product_order_detail_id"
    t.index ["product_order_id"], name: "index_product_deliveries_on_product_order_id"
  end

  create_table "product_likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_likes_on_product_id"
    t.index ["user_id"], name: "index_product_likes_on_user_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.integer "product_id"
    t.text "name"
    t.text "content"
    t.integer "price", default: 0
    t.text "status"
    t.integer "selled_count", default: 0
    t.integer "remain_count", default: 0
    t.text "image0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image1"
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "product_order_details", force: :cascade do |t|
    t.integer "address_num"
    t.text "address_text"
    t.text "address_text2"
    t.string "phone_num"
    t.string "phone_num2"
    t.string "email"
    t.string "name"
    t.integer "product_price"
    t.integer "delivery_price"
    t.integer "total_price"
    t.string "payment_method"
    t.integer "payment_amount"
    t.integer "product_delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_order_id"
    t.text "password"
    t.index ["product_delivery_id"], name: "index_product_order_details_on_product_delivery_id"
    t.index ["product_order_id"], name: "index_product_order_details_on_product_order_id"
  end

  create_table "product_orders", force: :cascade do |t|
    t.text "name"
    t.integer "product_id"
    t.integer "user_id"
    t.integer "package_id"
    t.string "status", default: "입금대기중"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_delivery_id"
    t.integer "product_order_detail_id"
    t.string "phone"
    t.string "case_type"
    t.string "imp_uid"
    t.index ["package_id"], name: "index_product_orders_on_package_id"
    t.index ["product_delivery_id"], name: "index_product_orders_on_product_delivery_id"
    t.index ["product_id"], name: "index_product_orders_on_product_id"
    t.index ["product_order_detail_id"], name: "index_product_orders_on_product_order_detail_id"
    t.index ["user_id"], name: "index_product_orders_on_user_id"
  end

  create_table "product_timelines", force: :cascade do |t|
    t.text "name"
    t.text "image0"
    t.datetime "issued_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_product_timelines_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.text "subname"
    t.datetime "start_date", default: "2018-08-16 20:46:42", null: false
    t.datetime "end_date", default: "2018-09-15 20:46:42", null: false
    t.text "youtb_url"
    t.text "video_text"
    t.text "bill_url"
    t.text "image0"
    t.text "assos"
    t.text "fb_url"
    t.text "image1"
    t.text "content"
    t.integer "funded_money", default: 0
    t.integer "funded_count", default: 0
    t.text "status"
    t.text "category"
    t.integer "goal_money", default: 1000000
    t.boolean "visible", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bill_id"
    t.text "bill_name"
    t.datetime "goods_dilivery_date"
    t.text "design_purpose"
    t.string "goods_dilivery_date_s"
  end

  create_table "recommends", force: :cascade do |t|
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responselogs", force: :cascade do |t|
    t.string "title"
    t.integer "maker_response_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sendlogs", force: :cascade do |t|
    t.string "from_email"
    t.string "to_email"
    t.integer "user_id"
    t.text "content"
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tosslogs", force: :cascade do |t|
    t.text "orderno"
    t.integer "amount"
    t.text "productdesc"
    t.text "paytoken"
    t.integer "status"
    t.integer "product_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text "image0"
    t.text "tokens"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
