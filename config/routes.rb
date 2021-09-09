Rails.application.routes.draw do
  root 'staticpages#index'
  resources :static_pages, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
