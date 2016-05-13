Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :videos, only: [:index, :new, :create]
root to: 'videos#index'

resources :video_uploads, only: [:new, :create]

get '/auth/:provider/callback', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy',  as: :logout

end
  