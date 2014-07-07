class TimerecordsController < ApplicationController
	def Index
	end

	def new
		#@time = Timerecord.where(:user_id => current_user.id).where(:timeout => nil).exists?
		
	    
	    @timerecord = Timerecord.new   
	    
	    @timerecord.jobnumber = params[:job_id]
	    
	end

	def edit
      #@openJob = Timerecord.where(:user_id => current_user.id).where(:timeout => nil)
      @timerecord = Timerecord.find(4)
    end

    def show
       @timerecord = Timerecord.find(params[:job_id])   
    end

	def create

	  @timerecord = Timerecord.new(timerecord_params)
	  @timerecord.user_id = current_user.id
	  @timerecord.timein = Time.current
	  @timerecord.save
	  
	  if @timerecord.save
  			redirect_to action: "index"
  		else
  			render 'new'
  		end
	end

	private
		def timerecord_params
		params.require(:timerecord).permit(:task, :jobnumber, :user_id, :inout, :task_id)
	end
end