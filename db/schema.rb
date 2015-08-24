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

ActiveRecord::Schema.define(version: 20150824095235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "live",       default: false
  end

  create_table "areas_audiences", force: :cascade do |t|
    t.integer "area_id"
    t.integer "audience_id"
  end

  create_table "audiences", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "care_home_metrics", force: :cascade do |t|
    t.integer  "care_home_id",                                 null: false
    t.date     "collection_date"
    t.integer  "capacity"
    t.integer  "residential_vacancies"
    t.integer  "nursing_vacancies"
    t.integer  "short_stay_vacancies"
    t.date     "vacancy_update_date"
    t.boolean  "quality_threshold_suspension", default: false, null: false
    t.boolean  "safeguarding_suspension",      default: false, null: false
    t.boolean  "safeguarding_notice",          default: false, null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "care_home_metrics", ["care_home_id"], name: "index_care_home_metrics_on_care_home_id", using: :btree

  create_table "care_homes", force: :cascade do |t|
    t.integer  "area_id",                                    null: false
    t.string   "cqc_location_uid",                           null: false
    t.text     "name",                                       null: false
    t.string   "town",                                       null: false
    t.string   "postcode",                                   null: false
    t.boolean  "nursing_care",               default: false, null: false
    t.boolean  "residential",                default: false, null: false
    t.boolean  "all_care",                   default: false, null: false
    t.boolean  "dementia_care",              default: false, null: false
    t.boolean  "learning_disabilities_care", default: false, null: false
    t.boolean  "mental_health_care",         default: false, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "care_homes", ["area_id"], name: "index_care_homes_on_area_id", using: :btree
  add_index "care_homes", ["cqc_location_uid"], name: "index_care_homes_on_cqc_location_uid", unique: true, using: :btree

  create_table "fund_verticals", force: :cascade do |t|
    t.string   "title"
    t.integer  "council_spend"
    t.integer  "nhs_spend"
    t.integer  "trend"
    t.integer  "area_id"
    t.integer  "audience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notices", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "population_metrics", force: :cascade do |t|
    t.date     "date"
    t.integer  "count"
    t.string   "title"
    t.integer  "area_id"
    t.integer  "audience_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "populations", force: :cascade do |t|
    t.date     "date"
    t.integer  "gender"
    t.integer  "count"
    t.integer  "audience_id"
    t.integer  "area_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
