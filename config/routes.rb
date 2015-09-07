Rails.application.routes.draw do
  root :to => 'days#index'
  resources :days do
  end
end
