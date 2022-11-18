Rails.application.routes.draw do
  resources :employees
  resources :personal_data
  
  root "main#index"

end
