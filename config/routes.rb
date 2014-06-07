Cursoo::Application.routes.draw do

  resources :users do
  	member do
  		get :profile
  	end
  end

  resources :books
  
end