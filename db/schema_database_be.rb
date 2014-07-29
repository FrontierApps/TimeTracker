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

ActiveRecord::Schema.define(version: 0) do

  create_table "calls", primary_key: "CallID", force: true do |t|
    t.integer   "ContactID"
    t.datetime  "CallDate"
    t.datetime  "CallTime"
    t.string    "Subject"
    t.text      "Notes",     limit: 2147483647
    t.timestamp "TIMESTAMP",                    null: false
  end

  add_index "calls", ["CallDate"], name: "CallDate", using: :btree
  add_index "calls", ["ContactID"], name: "ContactID", using: :btree

  create_table "contact types", primary_key: "ContactTypeID", force: true do |t|
    t.string    "ContactType", limit: 50
    t.timestamp "TIMESTAMP",              null: false
  end

  create_table "contacts", primary_key: "ContactID", force: true do |t|
    t.string    "FirstName",         limit: 50
    t.string    "LastName",          limit: 50
    t.string    "Dear",              limit: 50
    t.string    "Address"
    t.string    "Address1",          limit: 50
    t.string    "City",              limit: 50
    t.string    "StateOrProvince",   limit: 20
    t.string    "PostalCode",        limit: 20
    t.string    "Region",            limit: 50
    t.string    "Country",           limit: 50
    t.string    "CompanyName",       limit: 50
    t.string    "Title",             limit: 50
    t.string    "WorkPhone",         limit: 30
    t.string    "WorkExtension",     limit: 20
    t.string    "HomePhone",         limit: 30
    t.string    "MobilePhone",       limit: 30
    t.string    "FaxNumber",         limit: 30
    t.string    "EmailName",         limit: 50
    t.datetime  "Birthdate"
    t.datetime  "LastMeetingDate"
    t.integer   "ContactTypeID"
    t.string    "ReferredBy",        limit: 50
    t.text      "Notes",             limit: 2147483647
    t.string    "MaritalStatus",     limit: 20
    t.string    "SpouseName",        limit: 50
    t.string    "SpousesInterests"
    t.string    "ChildrenNames"
    t.string    "Hometown",          limit: 50
    t.string    "ContactsInterests"
    t.boolean   "Newsletter",                           default: false, null: false
    t.string    "Attn",              limit: 50
    t.timestamp "TIMESTAMP",                                            null: false
  end

  add_index "contacts", ["CompanyName"], name: "CompanyName", using: :btree
  add_index "contacts", ["ContactTypeID"], name: "ContactTypeID", using: :btree
  add_index "contacts", ["EmailName"], name: "EmailName", using: :btree
  add_index "contacts", ["LastName"], name: "LastName", using: :btree
  add_index "contacts", ["PostalCode"], name: "PostalCode", using: :btree

  create_table "job numbering", id: false, force: true do |t|
    t.integer   "Job_Number"
    t.string    "CustomerName", limit: 70
    t.string    "Date_Start",   limit: 50
    t.string    "ProjectName",  limit: 70
    t.boolean   "Finished",                default: false, null: false
    t.timestamp "TIMESTAMP",                               null: false
  end

  create_table "jobinfo", primary_key: "infoID", force: true do |t|
    t.string "JobNumber",  limit: 45
    t.string "ItemType",   limit: 45
    t.text   "Value"
    t.string "File",       limit: 45
    t.string "SignNumber", limit: 45
    t.string "sheet",      limit: 45
  end

  create_table "jobnumber", primary_key: "idJob", force: true do |t|
    t.string  "JobNumber",    limit: 45
    t.string  "CustomerName", limit: 45
    t.date    "DateStart"
    t.boolean "Complete",                 default: false
    t.string  "projectName",  limit: 45
    t.string  "Rep",          limit: 45
    t.string  "RequestedBy",  limit: 90
    t.string  "QuoteRef",     limit: 45
    t.date    "DueDate"
    t.string  "notes",        limit: 400
  end

  create_table "people", primary_key: "idContact", force: true do |t|
    t.string "idCompany",   limit: 45
    t.string "FirstName",   limit: 45
    t.string "LastName",    limit: 45
    t.string "MobilePhone", limit: 45
    t.string "DirectLine",  limit: 45
    t.string "Email",       limit: 45
    t.string "Order",       limit: 45
  end

  create_table "queries", id: false, force: true do |t|
    t.integer   "QueryID"
    t.string    "QueryName", limit: 50
    t.string    "QueryDesc"
    t.timestamp "TIMESTAMP",            null: false
  end

  add_index "queries", ["QueryID"], name: "QueryID", using: :btree

  create_table "quotenumbering", primary_key: "QuoteID", force: true do |t|
    t.string    "CustomerName", limit: 50
    t.string    "Date",         limit: 50
    t.string    "ProjectName",  limit: 50
    t.boolean   "Active",                  default: false, null: false
    t.string    "Estimator",    limit: 50
    t.boolean   "Wholesale",               default: false, null: false
    t.timestamp "TIMESTAMP",                               null: false
    t.string    "JobNumber",    limit: 45
  end

  add_index "quotenumbering", ["QuoteID"], name: "QuoteID", using: :btree

  create_table "reports", id: false, force: true do |t|
    t.integer   "ReportID"
    t.string    "ReportName", limit: 50
    t.string    "ReportDesc"
    t.timestamp "TIMESTAMP",             null: false
  end

  add_index "reports", ["ReportID"], name: "ReportID", using: :btree

  create_table "signnumber", primary_key: "signID", force: true do |t|
    t.string "SignNumber",  limit: 45
    t.string "description", limit: 45
    t.string "JobNumber",   limit: 45
  end

end
