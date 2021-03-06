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

ActiveRecord::Schema.define(version: 20161208203704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "center_id"
    t.index ["center_id"], name: "index_admins_on_center_id", using: :btree
  end

  create_table "admins_roles", id: false, force: :cascade do |t|
    t.integer "admin_id"
    t.integer "role_id"
    t.index ["admin_id", "role_id"], name: "index_admins_roles_on_admin_id_and_role_id", using: :btree
  end

  create_table "availabilities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "centers", force: :cascade do |t|
    t.string   "name"
    t.string   "manager_name"
    t.string   "email"
    t.string   "contact_number"
    t.string   "address"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "fax_number"
  end

  create_table "certifications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certifications_volunteers", force: :cascade do |t|
    t.integer  "certification_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["certification_id"], name: "index_certifications_volunteers_on_certification_id", using: :btree
    t.index ["volunteer_id"], name: "index_certifications_volunteers_on_volunteer_id", using: :btree
  end

  create_table "event_job_requirements", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "job_title"
    t.integer  "number_of_volunteers"
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["event_id"], name: "index_event_job_requirements_on_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "center_id"
    t.string   "event_name"
    t.integer  "number_of_volunteers"
    t.text     "location"
    t.text     "description"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "duration",             default: 0
    t.string   "state",                default: "draft"
  end

  create_table "formal_educations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferred_availabilities", force: :cascade do |t|
    t.integer  "availability_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["availability_id"], name: "index_preferred_availabilities_on_availability_id", using: :btree
    t.index ["volunteer_id"], name: "index_preferred_availabilities_on_volunteer_id", using: :btree
  end

  create_table "preferred_centers", force: :cascade do |t|
    t.integer  "center_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["center_id"], name: "index_preferred_centers_on_center_id", using: :btree
    t.index ["volunteer_id"], name: "index_preferred_centers_on_volunteer_id", using: :btree
  end

  create_table "preferred_target_groups", force: :cascade do |t|
    t.integer  "target_group_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["target_group_id"], name: "index_preferred_target_groups_on_target_group_id", using: :btree
    t.index ["volunteer_id"], name: "index_preferred_target_groups_on_volunteer_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_volunteers", force: :cascade do |t|
    t.integer  "skill_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["skill_id"], name: "index_skills_volunteers_on_skill_id", using: :btree
    t.index ["volunteer_id"], name: "index_skills_volunteers_on_volunteer_id", using: :btree
  end

  create_table "target_groups", force: :cascade do |t|
    t.string "name"
  end

  create_table "volunteer_events", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "event_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "state",        default: "created"
    t.index ["event_id"], name: "index_volunteer_events_on_event_id", using: :btree
    t.index ["volunteer_id"], name: "index_volunteer_events_on_volunteer_id", using: :btree
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.date     "date_of_birth"
    t.integer  "mobile"
    t.string   "profession"
    t.text     "other_talents"
    t.text     "about_me"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "gender",                 default: 1
    t.integer  "formal_education_id"
    t.datetime "deleted_at"
    t.boolean  "email_notification",     default: true
    t.boolean  "adhoc",                  default: true
    t.string   "nric_no"
    t.integer  "marital_status"
    t.text     "address"
    t.integer  "home_phone_number"
    t.string   "language_spoken"
    t.text     "past_experience"
    t.index ["confirmation_token"], name: "index_volunteers_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_volunteers_on_email", unique: true, using: :btree
    t.index ["formal_education_id"], name: "index_volunteers_on_formal_education_id", using: :btree
    t.index ["reset_password_token"], name: "index_volunteers_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "admins", "centers"
  add_foreign_key "certifications_volunteers", "certifications"
  add_foreign_key "certifications_volunteers", "volunteers"
  add_foreign_key "preferred_target_groups", "target_groups"
  add_foreign_key "volunteers", "formal_educations"
end
