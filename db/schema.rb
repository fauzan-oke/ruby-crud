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

ActiveRecord::Schema[7.0].define(version: 2023_06_13_171713) do
  create_table "catproduct", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "category_name", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "departements", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "departementID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "failed_jobs", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "uuid", null: false
    t.text "connection", null: false
    t.text "queue", null: false
    t.text "payload", size: :long, null: false
    t.text "exception", size: :long, null: false
    t.timestamp "failed_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["uuid"], name: "failed_jobs_uuid_unique", unique: true
  end

  create_table "hak_akses", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "akses", null: false
  end

  create_table "migrations", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "migration", null: false
    t.integer "batch", null: false
  end

  create_table "orders", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "user_id", default: 1, null: false
    t.string "product_name", default: "item 1", null: false
    t.decimal "quantity", precision: 8, scale: 2, default: "1.0", null: false
    t.decimal "total_price", precision: 8, scale: 2, default: "1.0", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "product", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "product_name", null: false
    t.bigint "price", null: false
    t.integer "stok", null: false
    t.bigint "category_id", null: false, unsigned: true
    t.bigint "user_id", null: false, unsigned: true
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["category_id"], name: "product_category_id_foreign"
    t.index ["user_id"], name: "product_user_id_foreign"
  end

  create_table "spendings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "employeeID"
    t.date "date"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.string "token", null: false
    t.integer "user_level", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["username"], name: "user_username_unique", unique: true
  end

  create_table "users", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "nama", null: false
  end

  create_table "usersHakAkses", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "users_id", unsigned: true
    t.integer "hakAkses_id", unsigned: true
    t.index ["hakAkses_id"], name: "usershakakses_hakakses_id_foreign"
    t.index ["users_id"], name: "usershakakses_users_id_foreign"
  end

  add_foreign_key "product", "catproduct", column: "category_id", name: "product_category_id_foreign"
  add_foreign_key "product", "user", name: "product_user_id_foreign"
  add_foreign_key "usersHakAkses", "hak_akses", column: "hakAkses_id", name: "usershakakses_hakakses_id_foreign", on_update: :cascade, on_delete: :cascade
  add_foreign_key "usersHakAkses", "users", column: "users_id", name: "usershakakses_users_id_foreign", on_update: :cascade, on_delete: :cascade
end
