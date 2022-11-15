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

ActiveRecord::Schema[7.0].define(version: 2022_11_15_213058) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edlevels", force: :cascade do |t|
    t.integer "ed_level", null: false
    t.string "nivel", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "section"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjectdates", force: :cascade do |t|
    t.string "week_day", null: false
    t.time "starts_at", null: false
    t.time "ends_at", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_subjectdates_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.integer "participants", null: false
    t.string "times_week", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "edlevel_id"
    t.bigint "section_id"
    t.index ["edlevel_id"], name: "index_subjects_on_edlevel_id"
    t.index ["section_id"], name: "index_subjects_on_section_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "edlevel_id"
    t.bigint "section_id"
    t.index ["edlevel_id"], name: "index_teachers_on_edlevel_id"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["section_id"], name: "index_teachers_on_section_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "edlevel_id"
    t.bigint "section_id"
    t.index ["edlevel_id"], name: "index_users_on_edlevel_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["section_id"], name: "index_users_on_section_id"
  end

  create_table "virtualclass", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_virtualclass_on_subject_id"
    t.index ["user_id"], name: "index_virtualclass_on_user_id"
  end

  add_foreign_key "subjectdates", "subjects"
  add_foreign_key "subjects", "edlevels"
  add_foreign_key "subjects", "sections"
  add_foreign_key "teachers", "edlevels"
  add_foreign_key "teachers", "sections"
  add_foreign_key "users", "edlevels"
  add_foreign_key "users", "sections"
  add_foreign_key "virtualclass", "subjects"
  add_foreign_key "virtualclass", "users"
end
