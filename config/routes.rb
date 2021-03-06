# frozen_string_literal: true

Rails.application.routes.draw do

  resources :interventions
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  get '/residential', to: 'home#residential'
  get '/commercial', to: 'home#commercial'
  get '/quote', to: 'home#quote'
  get '/index', to: 'home#index'
  post '/create_quotes' =>'quotes#create'
  post '/create_leads' => 'leads#create'
  get '/users/:id' , to: 'users#show'
  get '/users/:id/edit', to: 'users#edit', :as => :user
  patch '/users/:id/edit' => 'users#update'

  get 'dropbox/auth' => 'dropbox#auth'
  get 'dropbox/auth_callback' => 'dropbox#auth_callback'
  # get '/audio', to: 'admin/dashboard#file'

  get 'admin/ibm_call' => 'admin/dashboard#ibm_call'
  get '/get_buildings/:idOfCustomer', to: 'interventions#get_buildings'
  get '/get_batteries/:idOfBuilding', to: 'interventions#get_batteries'


  get '/get_columns/:idOfColumn', to: 'interventions#get_columns' # columnId
  get '/get_elevators/:idOfElevator', to: 'interventions#get_elevators' # elevatorId
  get '/get_employees/:idOfEmployee', to: 'interventions#get_employees' # employeeId
  post '/interventions/submit' => 'interventions#submit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
