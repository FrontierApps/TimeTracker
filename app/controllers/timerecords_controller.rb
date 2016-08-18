class TimerecordsController < ApplicationController
  layout 'loggedin'
    d=Time.zone.today
  $timenow = Time.zone.now 
    $beginning_of_this_week = d.at_beginning_of_week-1.day
    $end_of_this_week = d.at_beginning_of_week+5.day
    $beginning_of_last_week = d.at_beginning_of_week-8.day
    $end_of_last_week = d.at_beginning_of_week-2.day

  def index
    if current_user.admin?
      
    else
      params[:selecteduser] = current_user.id

    end
      @timerecords = Timerecord.filter(params.slice(:selecteduser, :weekstart, :weekend)).decorate
      @user = User.find(params[:selecteduser])
  end
  
  def show
    @jobnumber = Jobnumbers.jobnumber(params[:id]).first
    @contact = Contacts.contact(@jobnumber.contacts_id).first
    @timerecords = Timerecord.jobnumber(params[:id]).decorate
    
  end


  def new 
    if (params.has_key?(:selecteduser))
      @user_id = params[:selecteduser]
    else
      @user_id = current_user.id
    end
    if(params.has_key?(:job_id))
      time = Timerecord.currentuser(@user_id).notimeout.exists?
      if time
        @exist_timerecord = Timerecord.currentuser(@user_id).notimeout.first
        if (@exist_timerecord.jobnumber == params[:job_id])
        redirect_to :action => 'edit', :id => @exist_timerecord.id, :selecteduser => @user_id 

        else
        @old_timerecord = Timerecord.find_by(id: @exist_timerecord.id)
        flash[:notice] = "You were just timed out of job number "+ @exist_timerecord.jobnumber
        @old_timerecord.update(timeout: Time.zone.now)
        @timerecord = Timerecord.new      
        @timerecord.user_id = @user_id 
        @timerecord.jobnumber = params[:job_id]
        @timerecord.timein = Time.zone.now
        end

      else      
        @timerecord = Timerecord.new    
        @timerecord.user_id = @user_id  
        @timerecord.jobnumber = params[:job_id]
        @timerecord.timein = Time.zone.now
      end
    else
      @timerecord = Timerecord.new    
      @timerecord.user_id = params[:user_id]
    end
  end

  def create
    @user_id = params[:timerecord][:user_id]
    time = Timerecord.currentuser(@user_id).notimeout.exists?
    if time && params[:addrecord] != "1"
      @exist_timerecord = Timerecord.currentuser(@user_id).notimeout.first
      redirect_to :action => 'edit', :id => @exist_timerecord.id, :selecteduser => @user_id 
    else
      @timerecord = Timerecord.new(timerecord_params)
      @timerecord.save

      if @timerecord.save
        redirect_to timerecords_path(:selecteduser => @timerecord.user_id, :weekstart => $beginning_of_this_week, :weekend => $end_of_this_week)

      else
      flash[:notice] = "Something didn't work"
      render 'new'

      end
    end
  end

  def timeout

    @timerecord = Timerecord.find(params[:id])
    @task = Task.find(@timerecord.task_id)

  end

  def edit

    @timerecord = Timerecord.find(params[:id])
    if @timerecord.timeout
    else
    @timerecord.timeout = Time.zone.now
    end
    @task = Task.find(@timerecord.task_id)
    
  end 
  def add_timerecord
    @timerecord = Timerecord.new    
    @timerecord.user_id = params[:user_id]
    
    
  end
  def update
    @timerecord = Timerecord.find(params[:id])
    if @timerecord.update(timerecord_params)
      redirect_to timerecords_path(:selecteduser => @timerecord.user_id, :weekstart => $beginning_of_this_week, :weekend => $end_of_this_week)
    else
      flash[:notice] = "Something didn't work"
      render 'edit'
    end
  end
  def destroy
        @timerecord = Timerecord.find(params[:id])
        @timerecord.destroy

        redirect_to timerecords_path(:selecteduser => @timerecord.user_id, :weekstart => $beginning_of_this_week, :weekend => $end_of_this_week)
  end



private

# A list of the param names that can be used for filtering the Product list
def filtering_params(params)
  params.slice(:selecteduser, :weekstart, :weekend)
end

def timerecord_params
    params.require(:timerecord).permit(:jobnumber, :user_id, :timein, :timeout, :task_id)
end

def timerecord1_params
  params.permit(:jobnumber, :user_id, :timein, :timeout, :task_id)
end

end