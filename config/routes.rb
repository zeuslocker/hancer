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

  resources :input_values, except: [:edit] do
    collection do
      post 'update_collection'
      post 'edit_truck_block'
      delete 'destroy_collection'
    end
  end

  resources :bills, only: [:index] do
    collection do
      get 'bill_pdf'
    end
  end
end
