class UsersController < ApplicationController
  before_filter :verify_is_admin
  
  layout 'user'

  def index
  	@users=User.all
  	if params[:id]
      @user = User.find(params[:id]).decorate
          respond_to do |format|
            format.html { render "show" }
            format.js { render "show" }
          end
      else
      end
  end

  def show
  	@user = User.find(params[:id])
    respond_to do |format|
      format.html { render "show" }
      format.js { render "show" }
    end
  end

	
	def edit
		@user = User.find(params[:id])
	end

	
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		respond_to do |format|
		format.js { render "show" }
		end

		else 

		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to user_path
	end

	private
	def user_params
		params.require(:user).permit(:email, :firstname, :lastname, :admin, :active)
	end
	
	def verify_is_admin
  		(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
	end
	end