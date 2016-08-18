class Contacts < ActiveRecord::Base

	has_many :jobnumbers
	has_many :timerecords, through: :jobnumbers
		
  default_scope {order('CompanyName ASC')}
  
	scope :contact, ->(contact) {where('id = ?', contact )}	

end
