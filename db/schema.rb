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

ActiveRecord::Schema[7.0].define(version: 2022_11_15_224126) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "classrooms", force: :cascade do |t|
    t.bigint "edlevel_id", null: false
    t.bigint "section_id", null: false
    t.integer "participants", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["edlevel_id"], name: "index_classrooms_on_edlevel_id"
    t.index ["section_id"], name: "index_classrooms_on_section_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edlevels", force: :cascade do |t|
    t.integer "ed_level", null: false
    t.integer "nivel", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "section", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "active", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "classroom_id"
    t.index ["classroom_id"], name: "index_students_on_classroom_id"
    t.index ["email"], name: "index_students_on_email", unique: true
  end

  create_table "subjectdates", force: :cascade do |t|
    t.integer "week_day", default: 0
    t.time "starts_at", null: false
    t.time "ends_at", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_subjectdates_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "times_week", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "classroom_id"
    t.bigint "course_id"
    t.bigint "teacher_id"
    t.bigint "subjectdate_id"
    t.index ["classroom_id"], name: "index_subjects_on_classroom_id"
    t.index ["course_id"], name: "index_subjects_on_course_id"
    t.index ["subjectdate_id"], name: "index_subjects_on_subjectdate_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
  end

  add_foreign_key "classrooms", "edlevels"
  add_foreign_key "classrooms", "sections"
  add_foreign_key "students", "classrooms"
  add_foreign_key "subjectdates", "subjects"
  add_foreign_key "subjects", "classrooms"
  add_foreign_key "subjects", "courses"
  add_foreign_key "subjects", "subjectdates"
  add_foreign_key "subjects", "teachers"
end
