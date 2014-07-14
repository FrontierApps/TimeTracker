class TimerecordsController < ApplicationController
	def index
	 d=DateTime.now
	 d=d.at_beginning_of_week
     
	 @tasks = Task.all
	 @timerecord = Timerecord.where(:user_id => current_user.id).where('updated_at >= ?', d).all
	 @timetotal = 0
	 @timerecord.each do |t|
	 if (t.timeout == nil)
	 else	
	   @timetotal = @timetotal + (t.timeout - t.timein)
	 end
	 end
	 
	 

	end
	def new
				
		 time = Timerecord.where(:user_id => current_user.id).where(:timeout => nil).exists?
	  if time
		@timerecord = Timerecord.where(:user_id => current_user.id).where(:timeout => nil).first
     	redirect_to :action => 'edit', :id => @timerecord.id		
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