class Contacts < ActiveRecord::Base
	has_many :jobnumbers
	has_many :timerecords, through: :jobnumbers
end
