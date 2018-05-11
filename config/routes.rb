Rails.application.routes.draw do
  devise_for :users #使用Devise建立User model時產生的
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "restaurants#index"

  namespace :admin do
    resources :restaurants #會產生一組URL Helper和網址 對應到不同的Action
    root "restaurants#index"
  end
end
