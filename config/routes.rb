Rails.application.routes.draw do
  root 'static_pages#index'
  get 'search', controller: 'static_pages', action: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
