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

ActiveRecord::Schema.define(version: 2021_03_17_023222) do

  create_table "alternatives", force: :cascade do |t|
    t.integer "original_ingredient_id"
    t.integer "alternative_ingredient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "notes"
    t.integer "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "commenter_id"
    t.integer "ingredient_id"
    t.integer "measurement_id"
    t.integer "dietary_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "alternative_id"
    t.integer "dietary_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_sensitivities", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "sensitivity_id"
    t.integer "dietary_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ingredient_id", "sensitivity_id"], name: "index_food_sensitivities_on_ingredient_id_and_sensitivity_id", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "alternative_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "original_ingredients", force: :cascade do |t|
    t.string "original"
    t.text "notes"
    t.integer "type_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sensitivity_id"
  end

  create_table "sensitivities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_sensitivities", force: :cascade do |t|
    t.integer "user_id"
    t.integer "sensitivity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
