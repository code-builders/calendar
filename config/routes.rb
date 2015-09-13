Rails.application.routes.draw do
  root :to => 'days#home'
  resources :days do
    resources :activities
  end
end
