# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_12_26_081830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "bookings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "customer_id"
    t.uuid "event_id"
    t.uuid "ticket_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["event_id"], name: "index_bookings_on_event_id"
    t.index ["ticket_id"], name: "index_bookings_on_ticket_id"
  end

  create_table "customers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "event_organizers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_event_organizers_on_email", unique: true
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.string "venue"
    t.string "description"
    t.uuid "event_organizer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_organizer_id"], name: "index_events_on_event_organizer_id"
    t.index ["name"], name: "index_events_on_name", unique: true
  end

  create_table "tickets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type", null: false
    t.boolean "availability", default: true
    t.string "pricing"
    t.uuid "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["type", "event_id"], name: "index_tickets_on_type_and_event_id", unique: true
    t.index ["type"], name: "index_tickets_on_type"
  end

end
