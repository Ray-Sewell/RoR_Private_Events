Rails.application.routes.draw do
  root "events#index"
  resources :events
  resources :users, only: [:new, :show, :create]
  resources :event_attendees, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
