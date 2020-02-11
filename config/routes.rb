Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get "toppages", to: "toppages#index"
  
    root to: "tasks#index"
    resources :tasks
    
    get "signup", to: "users#new"
    resources :users, only: [:new, :create]
    
end
