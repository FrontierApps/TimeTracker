class ContactsController < ApplicationController
  def index
  	
  	@contacts = Contacts.all.order('CompanyName asc')
  end
end
