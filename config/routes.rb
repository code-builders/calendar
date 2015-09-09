Rails.application.routes.draw do
  root :to => 'days#index'
  resources :days
end
