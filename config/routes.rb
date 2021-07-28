Rails.application.routes.draw do
  namespace :super_admin do
    resources :subscription_plans
    # get 'subscription_plans/index'
    # get 'subscription_plans/new'
    # get 'subscription_plans/show'
    # get 'subscription_plans/edit'
  end
  # get 'about/index'
  # get 'user_dashboard/index'
  # get 'subscriptions/index'
  get 'sessions/new'
  # get 'home/index'
  devise_for :users
  get 'super_admin_dashboard/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :home, controller: "home" do
    collection do
      get '/subscription', to: 'home#subscription'
      get '/our_services', to: 'home#our_services'
    end
  end

  resources :user_dashboard, controller: "user_dashboard" do
    collection do
      get '/subscription', to: 'user_dashboard#subscription'
    end
  end
end
