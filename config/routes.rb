Rails.application.routes.draw do
  resources :url_shorteners, only: [:create, :show], path: ''
end
