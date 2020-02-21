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

ActiveRecord::Schema.define(version: 2020_02_20_172300) do

  create_table "currencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "prices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.decimal "volume_24h", precision: 10, scale: 3, null: false
    t.decimal "volume", precision: 10, scale: 3, null: false
    t.datetime "transition_time", null: false
    t.string "status", null: false
    t.integer "session", null: false
    t.decimal "prev_close", precision: 10, scale: 3, null: false
    t.decimal "last", precision: 10, scale: 3, null: false
    t.datetime "current_time", null: false
    t.decimal "bid", precision: 10, scale: 3, null: false
    t.decimal "ask", precision: 10, scale: 3, null: false
    t.integer "currency_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["currency_id"], name: "index_prices_on_currency_id"
    t.index ["current_time"], name: "index_prices_on_current_time"
    t.index ["last"], name: "index_prices_on_last"
  end

end
