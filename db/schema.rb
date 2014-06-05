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

ActiveRecord::Schema.define(version: 20140605135828) do

  create_table "contacts", force: true do |t|
    t.string   "surname"
    t.string   "name_patronymic"
    t.text     "about"
    t.integer  "phone"
    t.string   "address"
    t.integer  "fax"
    t.string   "email"
    t.string   "skype"
    t.string   "site"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "notepages", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "notesection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notepages", ["notesection_id"], name: "index_notepages_on_notesection_id", using: :btree

  create_table "notesections", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notesections", ["user_id"], name: "index_notesections_on_user_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "execution_status"
    t.boolean  "urgency_status"
    t.date     "completion_date"
    t.integer  "todopage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "tasks", ["todopage_id"], name: "index_tasks_on_todopage_id", using: :btree

  create_table "todopages", force: true do |t|
    t.string   "title"
    t.integer  "todosection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "todopages", ["todosection_id"], name: "index_todopages_on_todosection_id", using: :btree

  create_table "todosections", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "todosections", ["user_id"], name: "index_todosections_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
