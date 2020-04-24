Rails.application.routes.draw do
  resources :employees

  get "city_update" => 'employees#city_update', as: "city_update"

  get 'relocation_requests'  => 'employees#relocation_requests'
  
  # get 'relocation_requests'  => 'employees#employees/relocation_requests'
  
  
  resources :cities

  get 'manager'  => 'employees#manager'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'employees#index'
end
