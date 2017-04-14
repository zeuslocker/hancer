Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :drivers, except: [:edit] do
    collection do
      post 'update_collection'
      get 'new_field'
    end
  end

  resources :trucks, except: [:edit] do
    collection do
      post 'update_collection'
      get 'new_field'
    end
  end

  resources :points, except: [:edit] do
    collection do
      post 'update_collection'
      get 'new_field'
    end
  end

  resources :clients, except: [:edit] do
    collection do
      post 'update_collection'
      get 'new_field'
      get 'new_input'
    end
  end

  resources :notes, except: [:edit] do
    collection do
      post 'update_collection'
      get 'new_field'
      get 'new_input'
      get 'client_fields_with_inputs'
    end
  end
end
