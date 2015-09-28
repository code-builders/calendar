Rails.application.routes.draw do
  root to: "days#today"
  get "/all", to: "days#index", as: :all_days
  resources :days, path: "/" do
    resources :activities, only: [:create, :update, :destroy]
  end
end
