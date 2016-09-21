Rails.application.routes.draw do
  resources :users
  resources :wall_posts

  get :token, controller: 'application'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
