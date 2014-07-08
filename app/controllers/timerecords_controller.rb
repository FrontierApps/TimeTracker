class TimerecordsController < ApplicationController
	def Index
	end

	def new
				
		 time = Timerecord.where(:user_id => current_user.id).where(:timeout => nil).exists?
	  if time

		@timerecord = Timerecord.where("user_id = ? AND timeout = ?", current_user.id, nil)
		#@timeid = Timerecord.find(params[:openJob])	  	
		redirect_to :action => 'edit', :id => @timerecord.id
		
	  else 
		  
		  @timerecord = Timerecord.new	    
	      @timerecord.jobnumber = params[:timerecord]
	  end
	end
	def create

	  @timerecord = Timerecord.new(timerecord_params)
	  @timerecord.user_id = current_user.id
	  @timerecord.timein = Time.current
	  @timerecord.save
	  
	  if @timerecord.save
  			redirect_to @timerecord
      else
  			render 'new'
  	  end
	end

	def edit
	  @timerecord = Timerecord.find(params[:id])
      @task = Task.find(@timerecord.task_id)
      #@openJob = Timerecord.where(:user_id => current_user.id).where(:timeout => nil)
      
    end

    def show
       @timerecord = Timerecord.find(params[:id])       
       @task = Task.find(@timerecord.task_id)  

    end	

	

	private
		def timerecord_params
		params.require(:timerecord).permit(:task, :jobnumber, :user_id, :inout, :task_id)
	end
end