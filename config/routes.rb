Rails.application.routes.draw do
  root to: 'urls#index'

  get 'result/:short_url', to: 'urls#result', as: :result
  resources :urls, only: :create 
end
