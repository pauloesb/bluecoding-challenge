Rails.application.routes.draw do
  root to: 'urls#index'
  get '/top-100', to: 'urls#top100', as: :top_100
  get '/:short_url', to: 'urls#redirect', as: :redirect
  get '/result/:short_url', to: 'urls#result', as: :result
  resources :urls, only: [:create] 
end
