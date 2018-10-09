Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories
  resources :developers
  get 'categories/:id/developers', to: 'developers#getByCategory'
end
