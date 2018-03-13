Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  get 'dashboard' => 'dashboard#index'
  get 'dashboard/search' => 'dashboard#search'
  post 'dashboard/search' => 'dashboard#perform_search'
  post 'favorites' => 'favorites#create'
  get 'favorite_cities' => 'favorites#cities'
  root :to => 'marketing#index'
end
