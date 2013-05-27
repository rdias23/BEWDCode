Rewsly::Application.routes.draw do
  root to: 'stories#index'
  get "/search", to: "stories#search"
  resources :stories, only: [:index, :search, :create, :new, :show, :destroy]
end
