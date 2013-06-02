Rewsly::Application.routes.draw do
  resources :sources

  root to: 'stories#index'
  get "/search", to: "stories#search"
  get "/categories", to: "stories#categories"
  get "/category", to: "stories#category"
  resources :stories, only: [:index, :search, :create, :new, :edit, :update, :show, :destroy]
end
