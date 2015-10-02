Rails.application.routes.draw do
  root to: "days#today"
  get "/all", to: "days#index", as: :all_days
  get "/required-learning", to: "activities#index", as: :required_learning
  resources :days, path: "/" do
    resources :activities, only: [:create, :update, :destroy, :index]
  end
end
