class Job < ActiveRecord::Base
	has_many :timerecords
end
