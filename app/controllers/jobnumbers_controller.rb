class JobnumbersController < ApplicationController
	def new
        @jobnumber = Jobnumbers.new
    end
    def edit
        @jobnumber = Jobnumbers.find(params[:id])
    end
	def index
     
      @jobnumbers = Jobnumbers.all
      
    end
    def create
        @jobnumber = Jobnumbers.new(jobnumber_params)
        if @jobnumber.save
            respond_to do |format|
                format.js { render "show" }
            end
        else
            
        end
    end

    def update
        @jobnumber = Jobnumbers.find(params[:id])
        if @jobnumber.update(jobnumber_params)
            respond_to do |format|
                format.js { render "show" }
            end
        
        else 
            
        end
    end

    def destroy
        @jobnumber = Jobnumbers.find(params[:id])
        @jobnumber.destroy

        redirect_to jobnumbers_path
    end
 
    private
    def jobnumber_params
        params.require(:jobnumber).permit(:CompanyName, :Address, :Address1, :City, :StateOrProvince, :PostalCode, :WorkPhone, :FaxNumber)
    end
end
