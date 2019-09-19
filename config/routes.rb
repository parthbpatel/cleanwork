Rails.application.routes.draw do
  get    '/signup', 	to: 'customers#new'
  post   '/signup',   to: 'customers#create'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'


  resources :customers do
    resources :bookings do
      resources :cities
    end
  end

  resources :cleaners
  resources :cities
  root 'sessions#new'
end



















#   get 'sessions/new'
#   post 'login' => 'sessions#create'
#   delete 'logout' => 'sessions#destroy'
#   get 'city/index'
#
#   resources :customers do
#     resources :cities do
#       resources :bookings
#     end
#   end
#
#   resources :customer do
#     get 'booking', to: 'customers#booking'
#     resources :bookings
#   end
#
#   resources :customers do
#     resources :bookings
#   end
#
#   resources :cleaners do
#     get 'cleaner_booking', to: 'cleaners#cleaner_booking'
#   end
#
#   resources :cities
#   root 'sessions#new'
# end
