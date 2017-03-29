Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :drivers, except: [:edit]
  resources :trucks, except: [:edit]
end
