Rails.application.routes.draw do

devise_for :users, :controllers => { registrations: 'registrations' }
devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy' 
end
resources :users
root 'contacts#index'

resources :timerecords
resources :jobnumbers
  
get 'timerecords/timeout/:id' => 'timerecords#timeout'  
 
resources :contacts do
	resources :jobnumbers
end
  
 
end
