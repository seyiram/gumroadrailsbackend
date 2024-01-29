# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_29_233951) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_details", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "attribute_name"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_details_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.string "url"
    t.string "custom_domain"
    t.string "cover_image"
    t.string "thumbnail_image"
    t.string "product_type"
    t.string "call_to_action"
    t.decimal "price", precision: 10, scale: 2
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "custom_permalink"
    t.text "custom_receipt"
    t.text "custom_summary"
    t.boolean "customizable_price"
    t.boolean "deleted"
    t.integer "max_purchase_count"
    t.string "preview_url"
    t.boolean "require_shipping"
    t.string "subscription_duration"
    t.boolean "published"
    t.string "gumroad_id"
    t.string "short_url"
    t.string "thumbnail_url"
    t.string "formatted_price"
    t.json "file_info"
    t.integer "sales_count"
    t.integer "sales_usd_cents"
    t.boolean "is_tiered_membership"
    t.json "recurrences"
    t.string "tags", default: [], array: true
    t.json "purchasing_power_parity_prices"
    t.json "variants"
    t.json "custom_fields"
    t.integer "user_product_number"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio"
    t.string "name"
    t.string "twitter_handle"
    t.string "gumroad_user_id"
    t.string "url"
  end

  add_foreign_key "product_details", "products"
  add_foreign_key "products", "users"
end
