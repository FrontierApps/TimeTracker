class Contacts < ActiveRecord::Base	
	has many :jobnumbers
	has_many :timerecords, through: :jobnumbers
end
