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

<<<<<<< HEAD
<<<<<<< HEAD

ActiveRecord::Schema[7.0].define(version: 2024_07_05_042636) do
=======
ActiveRecord::Schema[7.0].define(version: 2024_07_08_015352) do
>>>>>>> 61c111b (sign-up)
=======
ActiveRecord::Schema[7.0].define(version: 2024_07_08_072320) do
>>>>>>> 9ed21d8 (sign-up)
  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
  end

  create_table "productts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.integer "age"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
<<<<<<< HEAD
<<<<<<< HEAD
=======
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
>>>>>>> 61c111b (sign-up)
=======
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
>>>>>>> 9ed21d8 (sign-up)
  end

end
