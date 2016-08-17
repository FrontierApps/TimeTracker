 
class ContactsController < ApplicationController
 
    layout 'contact'
    def new
        @contact = Contacts.new
    end
    def edit
        @contact = Contacts.find(params[:id])
    end
    
    def index
     
      @contacts = Contacts.all.order('CompanyName asc')
      if params[:id]
      @contact = Contacts.find(params[:id])
          respond_to do |format|
            format.html { render "show" }
            format.js { render "show" }
          end
      else
      end
    end

    def show
    @contact = Contacts.find(params[:id])
    
        respond_to do |format|
          format.html { render "show" }
          format.js { render "show" }
        end
    end
        
    def create
        @contact = Contacts.new(contact_params)
        if @contact.save
            respond_to do |format|
                format.js { render "show" }
            end
        else
            
        end
    end

    def update
        @contact = Contacts.find(params[:id])
        if @contact.update(contact_params)
            respond_to do |format|
                format.js { render "show" }
            end
        
        else 
            
        end
    end

    def destroy
        @contact = Contacts.find(params[:id])
        @contact.destroy

        redirect_to contacts_path
    end
    
    private
    def contact_params
        params.require(:contact).permit(:CompanyName, :Address, :Address1, :City, :StateOrProvince, :PostalCode, :WorkPhone, :FaxNumber)
    end
end