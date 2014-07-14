class Task < ActiveRecord::Base
	has_many :timerecords
	has_many :users, through: :timerecords
end
