Rails.application.routes.draw do
  root to: "days#today"
  get "/all", to: "days#index", as: :all_days
  get "/required-learning", to: "activities#index", as: :required_learning
  post "/activities/:activity_id/links", to: "links#create", as: :activity_links
  resources :days, path: "/" do
    resources :activities, only: [:edit, :create, :update, :destroy, :index]
  end
end
