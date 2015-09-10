Rails.application.routes.draw do
  root :to => 'days#home'
  resources :days
end
