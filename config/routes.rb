Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: [:index, :show, :create]
    get :"articles", controller: :articles, action: :index
  end
end
