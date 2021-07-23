Rails.application.routes.draw do
  get 'subscriptions/index'
  get 'sessions/new'
  get 'home/index'
  devise_for :users
  get 'super_admin_dashboard/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
