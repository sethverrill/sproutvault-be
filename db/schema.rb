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

ActiveRecord::Schema[8.0].define(version: 2025_03_16_205904) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_children_on_user_id"
  end

  create_table "daycare_hours", force: :cascade do |t|
    t.bigint "daycare_provider_id", null: false
    t.bigint "child_id", null: false
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.interval "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_daycare_hours_on_child_id"
    t.index ["daycare_provider_id"], name: "index_daycare_hours_on_daycare_provider_id"
  end

  create_table "daycare_providers", force: :cascade do |t|
    t.string "name"
    t.string "provider_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "lower((email)::text)", name: "index_users_on_lower_email", unique: true
  end

  add_foreign_key "children", "users"
  add_foreign_key "daycare_hours", "children"
  add_foreign_key "daycare_hours", "daycare_providers"
end
