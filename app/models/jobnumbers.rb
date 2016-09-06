class Jobnumbers < ActiveRecord::Base
	belongs_to :contacts
	has_many :timerecords

	default_scope {order('DateStart DESC')}

	scope :jobnumber, ->(jobnumber) {where('JobNumber = ?', jobnumber )}
	scope :contact, ->(contact) {where('contacts_id = ?', contact )}
	
	end
