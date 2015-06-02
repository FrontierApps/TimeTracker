class TimerecordsController < ApplicationController
skip_before_filter :verify_authenticity_token, :only => ['admin']
  $tasks = Task.all
  $users = User.all 
 def admin         
  @jobnumber = Jobnumbers.all
  @timrecord = Timerecord.all
  
 end

	def index
  if (params[:startdate] == nil)
   d=Date.today
   @startdate = d.at_beginning_of_week-1.day
   @enddate = d.at_beginning_of_week+5.day
   else
   @startdate=params[:startdate].to_date
   @enddate=params[:enddate].to_date
   end
	 @timerecord = Timerecord.currentuser(current_user.id).timethisweek
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
		 time = Timerecord.currentuser(current_user.id).notimeout.exists?
	  
    if time
    @exist_timerecord = Timerecord.currentuser(current_user.id).notimeout.first
    
      if (@exist_timerecord.jobnumber == params[:job_id])
       redirect_to :action => 'timeout', :id => @exist_timerecord.id		
      
      else
       @old_timerecord = Timerecord.find_by(id: @exist_timerecord.id)
       flash[:notice] = "You were just timed out of job number "+ @exist_timerecord.jobnumber
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

	def timeout

	  @timerecord = Timerecord.find(params[:id])
      @task = Task.find(@timerecord.task_id)
     
    end

	def edit

	  @timerecord = Timerecord.find(params[:id])
      @task = Task.find(@timerecord.task_id)
     
    end
 def update
  @timerecord = Timerecord.find(params[:id])
  
   if (@timerecord.timeout == nil)
    @timerecord.timeout = Time.current
    @time_diff_components = Time.diff(@timerecord.timein, Time.current, '%m')
    @timerecord.total = @time_diff_components[:diff].to_f / 60
      
    if @timerecord.update(timerecord1_params)
    redirect_to @timerecord
    else
    render 'edit'
    end
   else
    @time_diff_components = Time.diff(@timerecord.timein, params[:timerecord][:timeout], '%m')
    @timerecord.total = @time_diff_components[:diff].to_f / 60
    if @timerecord.update(timerecord_params)

    redirect_to @timerecord
    else
    render 'edit'
   end
  end
		
 end
 def employee
   if (params[:startdate] == nil)
   d=Date.today
   @startdate = d.at_beginning_of_week-1.day
   @enddate = d.at_beginning_of_week+5.day
   else
   @startdate=params[:startdate].to_date
   @enddate=params[:enddate].to_date
   end
  
   @timerecord = Timerecord.selecteduser(params[:id]).weekstart(@startdate).weekend(@enddate).order(:timeout)
   
 end
 def task
   if (params[:startdate] == nil)
   d=Date.today
   @startdate = d.at_beginning_of_week-1.day
   @enddate = d.at_beginning_of_week+5.day
   else
   @startdate=params[:startdate].to_date
   @enddate=params[:enddate].to_date
   end
  @task_all=Timerecord.tasks_all(params[:id]).weekstart(@startdate).weekend(@enddate)
  @timetotal = 0
  @task_all.each do |t|
   if (t.timeout == nil)
    @timetotal = @timetotal + (Time.current - t.timein)
   else 
    @timetotal = @timetotal + (t.timeout - t.timein)
   end
  end
 end

 
 def jobreport
  if (params[:search] == nil)
  @timerecord = Timerecord.thisjob(params[:id])
  @jobnumber = params[:id]
  else
  @timerecord = Timerecord.thisjob(params[:search])
  @jobnumber = params[:search]
  end

  @timetotal = 0
  @timerecord.each do |t|
   if (t.timeout == nil)
    @timetotal = @timetotal + (Time.current - t.timein)
   else 
    @timetotal = @timetotal + (t.timeout - t.timein)
   end
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