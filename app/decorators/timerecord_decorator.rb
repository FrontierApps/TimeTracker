class TimerecordDecorator < Draper::Decorator
	delegate_all
	decorates :timerecord
 def timed_out_status
		if timeout?
			"#{timed_out_at}"
		else
			h.content_tag :span, Time.zone.now.strftime("%I:%M %p"), class: "stillWorking"
						
		end
 end
 

    private

	def timed_out_at
		object.timeout.strftime("%I:%M %p")
	end
	


end
