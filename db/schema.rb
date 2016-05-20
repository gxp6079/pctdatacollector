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

ActiveRecord::Schema.define(version: 20160520043733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "file_examples", force: true do |t|
    t.integer  "system_example_id"
    t.string   "name"
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "file_examples", ["system_example_id"], name: "index_file_examples_on_system_example_id", using: :btree

  create_table "permanence_times", force: true do |t|
    t.integer  "task_id"
    t.integer  "system_example_id"
    t.integer  "file_example_id"
    t.integer  "user_id"
    t.integer  "seconds"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "permanence_times", ["file_example_id"], name: "index_permanence_times_on_file_example_id", using: :btree
  add_index "permanence_times", ["system_example_id"], name: "index_permanence_times_on_system_example_id", using: :btree
  add_index "permanence_times", ["task_id"], name: "index_permanence_times_on_task_id", using: :btree
  add_index "permanence_times", ["user_id"], name: "index_permanence_times_on_user_id", using: :btree

  create_table "system_examples", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_for_training", default: false
  end

  create_table "task_progresses", force: true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.boolean  "done",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answer",     default: "{}"
  end

  add_index "task_progresses", ["task_id"], name: "index_task_progresses_on_task_id", using: :btree
  add_index "task_progresses", ["user_id"], name: "index_task_progresses_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.integer  "system_example_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "html_question",     default: ""
  end

  add_index "tasks", ["system_example_id"], name: "index_tasks_on_system_example_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "subject"
    t.string   "group",                  default: "n/a"
    t.boolean  "is_active",              default: false
    t.boolean  "is_time_trackable",      default: false
    t.boolean  "is_in_training",         default: false
    t.string   "task_file_ids_order",    default: "[]"
    t.boolean  "training_done",          default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
