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

ActiveRecord::Schema[7.0].define(version: 2023_03_04_062332) do
  create_table "bookings", force: :cascade do |t|
    t.integer "room_id", null: false
    t.integer "employee_id", null: false
    t.date "check_in_date"
    t.date "check_out_date"
    t.integer "holder_id", null: false
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_bookings_on_employee_id"
    t.index ["holder_id"], name: "index_bookings_on_holder_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
  end

  create_table "bookings_guests", force: :cascade do |t|
    t.integer "booking_id", null: false
    t.integer "guest_id", null: false
    t.date "check_in_date"
    t.date "check_out_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_bookings_guests_on_booking_id"
    t.index ["guest_id"], name: "index_bookings_guests_on_guest_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.date "birthday"
    t.date "joining_date"
    t.float "salary"
    t.float "total"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hotel_id"
    t.integer "status"
    t.integer "role_id", default: 1, null: false
    t.index ["hotel_id"], name: "index_employees_on_hotel_id"
    t.index ["role_id"], name: "index_employees_on_role_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "full_name_en"
    t.string "full_name_ar"
    t.string "id_card_number"
    t.string "passport_number"
    t.string "mobile_number"
    t.string "email"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name_ar"
    t.string "name_en"
    t.integer "hotel_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_roles_on_hotel_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.boolean "reserved"
    t.string "floor_number"
    t.string "room_number"
    t.integer "max_capacity"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hotel_id"
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  add_foreign_key "bookings", "employees"
  add_foreign_key "bookings", "guests", column: "holder_id"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "bookings_guests", "bookings"
  add_foreign_key "bookings_guests", "guests"
  add_foreign_key "employees", "hotels"
  add_foreign_key "employees", "roles"
  add_foreign_key "rooms", "hotels"
end
