class Timerecord < ActiveRecord::Base
	belongs_to :user
	belongs_to :task
	d=Date.today
	d=d.at_beginning_of_week-1.day
	d1=d+7.day
	scope :notimeout, -> {where('timeout IS ?', nil)} 
	scope :timethisweek, -> {where('timein > ?', d).all} 
	scope :weekstart, -> (weekstart){where('timein >= ?', weekstart).all} 
	scope :dateis, -> (date){where('timein = ?', date).all} 
	scope :weekend, -> (weekend){where('timein <= ?', weekend).all} 
	scope :currentuser, ->(user) {where('user_id = ?', user )} 
	scope :selecteduser, ->(user) {where('user_id = ?', user )} 
	scope :thisjob, ->(number) {where('jobnumber = ?', number )} 
	scope :tasks_all, ->(taskid){where('task_id = ?', taskid)}
	
	
end
