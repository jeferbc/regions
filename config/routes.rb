Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'regions#index'
  resources :regions do
    resources :municipalities
  end
end
