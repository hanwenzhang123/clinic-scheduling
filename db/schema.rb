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

ActiveRecord::Schema[7.0].define(version: 2024_03_04_053527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bundles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "bundle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.bigint "shopping_cart_id"
    t.index ["bundle_id"], name: "index_cart_items_on_bundle_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
    t.index ["shopping_cart_id"], name: "index_cart_items_on_shopping_cart_id"
  end

  create_table "checkouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shopping_cart_id", null: false
    t.decimal "total_price"
    t.index ["shopping_cart_id"], name: "index_checkouts_on_shopping_cart_id"
  end

  create_table "consultations", force: :cascade do |t|
    t.bigint "provider_id", null: false
    t.bigint "member_id", null: false
    t.string "status"
    t.string "start_time"
    t.string "end_time"
    t.date "appointment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_consultations_on_member_id"
    t.index ["provider_id"], name: "index_consultations_on_provider_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "consultation_id"
    t.integer "past_consultation_ids", default: [], array: true
    t.index ["consultation_id"], name: "index_members_on_consultation_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "consultation_id"
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultation_id"], name: "index_messages_on_consultation_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provider_availabilities", force: :cascade do |t|
    t.bigint "provider_id"
    t.string "day_of_week"
    t.string "shift_start_time"
    t.string "shift_end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_provider_availabilities_on_provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "speciality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cart_items", "bundles"
  add_foreign_key "cart_items", "products"
  add_foreign_key "cart_items", "shopping_carts"
  add_foreign_key "checkouts", "shopping_carts"
  add_foreign_key "consultations", "members", on_delete: :cascade
  add_foreign_key "consultations", "providers", on_delete: :cascade
  add_foreign_key "members", "consultations", on_delete: :cascade
  add_foreign_key "members", "users", on_delete: :cascade
  add_foreign_key "messages", "consultations"
  add_foreign_key "provider_availabilities", "providers"
  add_foreign_key "providers", "users", on_delete: :cascade
  add_foreign_key "shopping_carts", "users"
end
