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

ActiveRecord::Schema.define(version: 20150322013148) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "agent_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "license_number"
    t.date     "license_expiration"
    t.string   "mobile_phone"
    t.string   "agent_physical_address"
    t.string   "agent_city"
    t.string   "agent_state"
    t.string   "agent_zip"
    t.string   "company_name"
    t.string   "company_address"
    t.string   "company_city"
    t.string   "company_state"
    t.string   "company_zip"
    t.string   "company_phone"
    t.string   "company_fax"
    t.string   "broker_name"
    t.string   "checks_payable_to"
    t.string   "payment_address"
    t.string   "payment_city"
    t.string   "payment_state"
    t.string   "payment_zip"
    t.boolean  "managing_broker"
    t.string   "managing_broker_name"
    t.boolean  "direct_payment"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["task_id"], name: "index_comments_on_task_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content_md"
    t.text     "content_html"
    t.boolean  "draft",        default: false
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "task_applications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "task_applications", ["task_id"], name: "index_task_applications_on_task_id"
  add_index "task_applications", ["user_id"], name: "index_task_applications_on_user_id"

  create_table "task_assignments", force: :cascade do |t|
    t.integer  "agent_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "task_assignments", ["agent_id"], name: "index_task_assignments_on_agent_id"
  add_index "task_assignments", ["task_id"], name: "index_task_assignments_on_task_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "short_description"
    t.date     "due_date_begin"
    t.date     "due_date_end"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "user_id"
    t.boolean  "quickly"
    t.integer  "time_estimate"
    t.string   "location"
    t.integer  "status",            default: 0
    t.integer  "price"
    t.integer  "assigned_agent"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "transactions", force: :cascade do |t|
    t.integer  "task_id"
    t.decimal  "amount"
    t.date     "trans_date"
    t.time     "trans_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "transactions", ["task_id"], name: "index_transactions_on_task_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "locked",                 default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "agreed"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
