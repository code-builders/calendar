Rails.application.routes.draw do

  resources :days, path: 'days#home' do
    resources :activities

  end
  get "/home" => "days#home"

end
