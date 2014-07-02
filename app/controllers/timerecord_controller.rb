class TimerecordController < ApplicationController
 def Index
 end

 def New
 	@timerecord = Timerecord.new
 end
end
