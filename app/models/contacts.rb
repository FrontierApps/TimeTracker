class Contacts < ActiveRecord::Base
any :jobnumbers
	has_many :timerecords, through: :jobnumbers
end
