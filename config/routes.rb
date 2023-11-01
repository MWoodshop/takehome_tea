Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :teas
      resources :customers do
        resources :subscriptions, only: %i[create index update destroy] do
          member do
            put :cancel
          end
        end
      end
      resources :subscriptions do
        resources :teas, controller: 'subscriptions_teas', only: %i[create index update destroy] do
          collection do
            get '', action: :index
            delete ':tea_id', action: :destroy
            post ':tea_id', action: :create
          end
        end
      end
      resources :customers_subscriptions, only: %i[create index update destroy] do
        collection do
          get 'by_customer/:customer_id', to: 'customers_subscriptions#by_customer'
          get 'by_subscription/:subscription_id', to: 'customers_subscriptions#by_subscription'
          post ':customer_id/:subscription_id', action: :create
          post ':customer_id/:subscription_id/cancel',
               to: 'customers_subscriptions#cancel_subscription'
        end
      end
    end
  end
end
