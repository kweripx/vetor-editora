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

ActiveRecord::Schema[7.1].define(version: 2024_04_14_030059) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluateds", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.date "birth_date"
    t.bigint "psychologist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["psychologist_id"], name: "index_evaluateds_on_psychologist_id"
  end

  create_table "instrument_applications", force: :cascade do |t|
    t.bigint "evaluated_id", null: false
    t.bigint "instrument_id", null: false
    t.integer "score"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluated_id"], name: "index_instrument_applications_on_evaluated_id"
    t.index ["instrument_id"], name: "index_instrument_applications_on_instrument_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "psychologist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["psychologist_id"], name: "index_instruments_on_psychologist_id"
  end

  create_table "psychologists", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "evaluateds", "psychologists"
  add_foreign_key "instrument_applications", "evaluateds"
  add_foreign_key "instrument_applications", "instruments"
  add_foreign_key "instruments", "psychologists"
end
