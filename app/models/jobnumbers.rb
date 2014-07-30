class Jobnumbers < ActiveRecord::Base
	belongs_to :contacts
	has_many :timerecords
	end
