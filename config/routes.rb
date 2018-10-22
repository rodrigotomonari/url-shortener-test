Rails.application.routes.draw do
  resources :url_shorteners, only: [:index, :create, :show], path: ''
end
