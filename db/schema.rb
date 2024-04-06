ActiveRecord::Schema[7.1].define(version: 2024_04_05_224259) do
  create_table "debts", force: :cascade do |t|
    t.integer "person_id", null: false
    t.float "amount"
    t.text "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_debts_on_person_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "person_id", null: false
    t.float "amount"
    t.date "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_payments_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "national_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "debts", "people"
  add_foreign_key "payments", "people"
  add_foreign_key "people", "users"
end
