Rails.application.routes.draw do
  resources :players
  get '/resetplayers', to: 'players#reset_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
