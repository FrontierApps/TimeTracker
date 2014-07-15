class TimerecordsController < ApplicationController
	def index
	 d=DateTime.now
	 d=d.at_beginning_of_week
     
	 @tasks = Task.all
	 @timerecord = Timerecord.where(:user_id => current_user.id).where('updated_at >= ?', d).all
	 @timetotal = 0
	 @timerecord.each do |t|
	 if (t.timeout == nil)
	 	@timetotal = @timetotal + (Time.current - t.timein)
	 else	
	   @timetotal = @timetotal + (t.timeout - t.timein)
	 end
	 end
	 
	 

	end
	def new				
		 time = Timerecord.where(:user_id => current_user.id).where(:timeout => nil).exists?
	  if time
		@exist_timerecord = Timerecord.where(:user_id => current_user.id).where(:timeout => nil).first
     	if (@exist_timerecord.jobnumber == params[:job_id])
     	redirect_to :action => 'edit', :id => @exist_timerecord.id		
        else
         flash[:notice] = "Go to your home"
         @old_timerecord = Timerecord.find_by(id: @exist_timerecord.id)
	     @old_timerecord.update(timeout: Time.current)
         @timerecord = Timerecord.new	    
	     @timerecord.jobnumber = params[:job_id]
        end
	  else 		  
		 @timerecord = Timerecord.new	    
	     @timerecord.jobnumber = params[:job_id]
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
     
    end
    def update
      @timerecord = Timerecord.find(params[:id])
 	  @timerecord.timeout = Time.current
      if @timerecord.update(timerecord1_params)
      	redirect_to @timerecord
      else
        render 'edit'
      end
    end

    def show
       @timerecord = Timerecord.find(params[:id])       
       @task = Task.find(@timerecord.task_id)  

    end	
	private
		def timerecord_params
		params.require(:timerecord).permit(:jobnumber, :user_id, :timein, :timeout, :task_id)
	end
	

	private
		def timerecord1_params
		params.permit(:jobnumber, :user_id, :timein, :timeout, :task_id)
	end
end