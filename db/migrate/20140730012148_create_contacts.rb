class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
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
      t.timestamps
    end
  end
end
