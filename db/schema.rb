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

ActiveRecord::Schema.define(version: 20160817150427) do

  create_table "contacts", force: :cascade do |t|
    t.string   "FirstName",         limit: 50
    t.string   "LastName",          limit: 50
    t.string   "Dear",              limit: 50
    t.string   "Address",           limit: 255
    t.string   "Address1",          limit: 50
    t.string   "City",              limit: 50
    t.string   "StateOrProvince",   limit: 20
    t.string   "PostalCode",        limit: 20
    t.string   "Region",            limit: 50
    t.string   "Country",           limit: 50
    t.string   "CompanyName",       limit: 50
    t.string   "Title",             limit: 50
    t.string   "WorkPhone",         limit: 30
    t.string   "WorkExtension",     limit: 20
    t.string   "HomePhone",         limit: 30
    t.string   "MobilePhone",       limit: 30
    t.string   "FaxNumber",         limit: 30
    t.string   "EmailName",         limit: 50
    t.datetime "Birthdate"
    t.datetime "LastMeetingDate"
    t.integer  "ContactTypeID",     limit: 4
    t.string   "ReferredBy",        limit: 50
    t.text     "Notes",             limit: 4294967295
    t.string   "MaritalStatus",     limit: 20
    t.string   "SpouseName",        limit: 50
    t.string   "SpousesInterests",  limit: 255
    t.string   "ChildrenNames",     limit: 255
    t.string   "Hometown",          limit: 50
    t.string   "ContactsInterests", limit: 255
    t.boolean  "Newsletter",                           default: false, null: false
    t.string   "Attn",              limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobnumbers", force: :cascade do |t|
    t.string   "JobNumber",   limit: 45
    t.string   "contacts_id", limit: 50
    t.date     "DateStart"
    t.boolean  "Complete",                default: false
    t.string   "projectName", limit: 45
    t.string   "Rep",         limit: 45
    t.string   "RequestedBy", limit: 90
    t.string   "QuoteRef",    limit: 45
    t.date     "DueDate"
    t.string   "notes",       limit: 400
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "taskname",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timerecords", force: :cascade do |t|
    t.string   "jobnumber",  limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "task_id",    limit: 4
    t.datetime "timein"
    t.datetime "timeout"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "total",      limit: 24
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                              default: false
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.integer  "active",                 limit: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
