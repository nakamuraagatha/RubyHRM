# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150808135736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certifications", force: :cascade do |t|
    t.string   "certification_description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_code"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "department_number"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "dependents", force: :cascade do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "relationship"
    t.date     "date_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "education_levels", force: :cascade do |t|
    t.string   "education_level_description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "emergency_contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "relationship"
    t.string   "home_phone"
    t.string   "business_phone"
    t.string   "mobile_phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "person_id"
  end

  create_table "job_detail_histories", force: :cascade do |t|
    t.integer  "person_id"
    t.date     "change_date"
    t.integer  "job_title_id"
    t.integer  "department_id"
    t.integer  "location_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "job_details", force: :cascade do |t|
    t.integer  "person_id"
    t.date     "start_date"
    t.integer  "job_title_id"
    t.integer  "department_id"
    t.integer  "location_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "job_titles", force: :cascade do |t|
    t.string   "job_title"
    t.text     "job_description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "language_description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "province"
    t.string   "postal"
    t.string   "country"
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "fax_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "pay_details", force: :cascade do |t|
    t.string   "person_id"
    t.string   "component_name"
    t.decimal  "pay_rate"
    t.string   "pay_frequency"
    t.string   "currency_code"
    t.text     "note"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "preferred_first"
    t.string   "national_id"
    t.string   "gender"
    t.date     "date_of_birth"
    t.string   "nationality"
    t.string   "marital_status"
    t.string   "military_status"
    t.boolean  "smoker"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name_suffix"
    t.string   "ethnicity"
    t.boolean  "disabled"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "province"
    t.string   "postal"
    t.string   "country"
    t.string   "employee_id"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "business_phone"
    t.string   "home_email"
    t.string   "business_email"
  end

  create_table "person_certifications", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "certification_id"
    t.string   "institute"
    t.date     "grant_date"
    t.date     "valid_thru_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "person_educations", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "education_level_id"
    t.string   "institute"
    t.date     "start_date"
    t.date     "completed_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "person_languages", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "language_id"
    t.string   "reading_proficiency"
    t.string   "writing_proficiency"
    t.string   "speaking_proficiency"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "person_skills", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "skill_id"
    t.string   "years_experience"
    t.text     "note"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "person_terminations", force: :cascade do |t|
    t.integer  "termination_reason_id"
    t.date     "termination_date"
    t.text     "note"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "person_id"
  end

  create_table "reporting_relationships", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "manager_id"
    t.string   "reporting_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "skill_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "states", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "state_code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "system_languages", force: :cascade do |t|
    t.string   "language_code"
    t.string   "language_description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "termination_reasons", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "translations", force: :cascade do |t|
    t.string   "locale"
    t.string   "key"
    t.text     "value"
    t.text     "interpolations"
    t.boolean  "is_proc",        default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "role"
    t.integer  "person_id"
    t.string   "auth_token"
    t.string   "email"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "locale",                 default: "en", null: false
  end

end
