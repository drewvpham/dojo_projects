Rails.application.routes.draw do
  resources :users, :path => "students"
  resources :projects
  root 'home#index'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/sessions/logout' => 'sessions#destroy'
  get '/about'=> 'home#about'
end
