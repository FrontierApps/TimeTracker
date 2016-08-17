Rails.application.routes.draw do

devise_for :users, :controllers => { registrations: 'registrations' }
resources :users
root 'contacts#index'

resources :timerecords
  
get 'timerecords/timeout/:id' => 'timerecords#timeout'  
 
resources :contacts
  
 
end
