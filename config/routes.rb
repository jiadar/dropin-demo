Rails.application.routes.draw do
  root to: "users#show"
  devise_for :users
  get 'gym/:id', to: "gyms#home", as: :gym_home
  get 'gyms/checkin', to: "gyms#checkin"
  get 'gyms/reservations', to: "gyms#reservations"
  get 'gyms/user_info', to: "gyms#user_info"
  get 'gyms/memberships', to: "gyms#memberships"
  get '/registrations/checkin/:id', to: "registrations#checkin", as: :checkin

  # User api methods 

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get 'users/index', to: "users#index"
      get 'users/public/:id', to: "users#public"
      get 'users/private/:id', to: "users#private"
      get 'users/preferences/:id', to: "users#preferences"

      get 'ledger/balance', to: "ledger_entries#balance"
      
      get 'gyms/index', to: "gyms#index"
      get 'gyms/id/:id', to: "gyms#find_by_id"

      get 'subscriptions/user', to: "subscriptions#user"

      get 'memberships/user', to: "memberships#user"

      get 'favorites/user', to: "favorites#user"
    end
  end
  
end

