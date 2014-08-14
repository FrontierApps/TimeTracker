class Timerecord < ActiveRecord::Base
	belongs_to :user
	belongs_to :task
	d=Date.today
	d=Date.today
	d=d.at_beginning_of_week-1.day
	d1=d.at_beginning_of_week-7.day
	scope :notimeout, -> {where('timeout IS ?', nil)} 
	scope :timethisweek, -> {where('timein > ?', d).all} 
	scope :weekstart, -> {where('timein >= ?', d1).all} 
	scope :weekend, -> {where('timein <= ?', d).all} 
	scope :currentuser, ->(user) {where('user_id = ?', user )} 
	scope :selecteduser, ->(user) {where('user_id = ?', user )} 
	
	
	
end
