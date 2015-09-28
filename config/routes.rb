Rails.application.routes.draw do
  root to: "days#today"
  resources :days do
    resources :activities, only: [:create, :update]
  end
end
