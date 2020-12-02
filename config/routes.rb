Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :flights, only: %i[index]
  resources :bookings, only: %i[new create show]
  root 'flights#index'
end
