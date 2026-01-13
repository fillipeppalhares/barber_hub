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

ActiveRecord::Schema[8.0].define(version: 2026_01_13_152306) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "barber_id", null: false
    t.bigint "service_id", null: false
    t.string "customer_name"
    t.time "start_time"
    t.time "end_time"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barber_id"], name: "index_appointments_on_barber_id"
    t.index ["service_id"], name: "index_appointments_on_service_id"
  end

  create_table "barber_shops", force: :cascade do |t|
    t.string "name"
    t.string "document"
    t.string "address"
    t.string "city"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "barbers", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.bigint "barber_shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barber_shop_id"], name: "index_barbers_on_barber_shop_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "weekday"
    t.time "start_time"
    t.time "end_time"
    t.boolean "active"
    t.bigint "barber_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barber_id"], name: "index_schedules_on_barber_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.integer "price"
    t.bigint "barber_shop_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barber_shop_id"], name: "index_services_on_barber_shop_id"
  end

  add_foreign_key "appointments", "barbers"
  add_foreign_key "appointments", "services"
  add_foreign_key "barbers", "barber_shops"
  add_foreign_key "schedules", "barbers"
  add_foreign_key "services", "barber_shops"
end
