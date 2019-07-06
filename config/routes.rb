Rails.application.routes.draw do
  root to: 'urls#index'

  get '/:short_url', to: 'urls#redirect', as: :redirect
  get '/result/:short_url', to: 'urls#result', as: :result
  resources :urls, only: [:create] 
end
