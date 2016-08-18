class Jobnumbers < ActiveRecord::Base
	belongs_to :contacts
	has_many :timerecords

	scope :jobnumber, ->(jobnumber) {where('JobNumber = ?', jobnumber )}
	
	end
