Rewsly::Application.routes.draw do
  root to: 'stories#index'
  get "/search", to: "stories#search"
  resources :stories, only: [:index, :search, :create, :new, :edit, :update, :show, :destroy]
end
