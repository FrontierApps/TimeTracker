class Timerecord < ActiveRecord::Base
	belongs_to :user
	belongs_to :task
	d=Date.today
	d=d.at_beginning_of_week-1.day
	scope :thisweek, -> {where('timein > ?', d).all} 
	scope :notimeout, -> {where('timeout IS ?', nil)} 
	scope :timethisweek, -> {where('timein > ?', d).all} 
	scope :currentuser, ->(user) {where('user_id = ?', user )} 
	scope :selecteduser, ->(user) {where('user_id = ?', user )} 
	
	
	
end
