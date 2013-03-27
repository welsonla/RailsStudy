SampleApp::Application.routes.draw do

  root :to =>  "static_pages#home"

  #Users Routes
  resources :users
  
  
  #Session Manager
  resources :sessions,only: [:new,:create,:destroy]
  match '/signup', to:'users#new'
  match '/signin', to:'sessions#new'
  match '/signout',to:'sessions#destroy', via: :delete

  #Static_page Routes
  match '/about' , to:"static_pages#about"

  match '/contact',to:"static_pages#contact"

  match '/home',   to: "static_pages#home"

  match '/help',   to:"static_pages#help"

end
