Rails.application.routes.draw do
  namespace :api do
    resources :articles, only:[:index, :show]
    get :"articles",controller: :articles,action: :index
    
  end
end
