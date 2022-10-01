Rails.application.routes.draw do
  resources :todo_items
  devise_for :accounts

  root to: 'todo_items#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
