class TimerecordsController < ApplicationController
	def Index
	end

	def new
				
		time = Timerecord.where(:user_id => current_user.id).where(:timeout => nil).exists?
		openJob = Timerecord.select("id").where(:user_id => current_user.id).where(:timeout => nil)	
		if time
		 render 'edit'
		  	
		  
		else 
		  flash[:notice] = "go home"
		  @timerecord = Timerecord.new	    
	        @timerecord.jobnumber = params[:job_id]
		end
	    
	    
	end

	def edit
      #@openJob = Timerecord.where(:user_id => current_user.id).where(:timeout => nil)
      @timerecord = Timerecord.find(openJob)
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