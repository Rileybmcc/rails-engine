Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #
  #   # namespace merchants? new items controller in merchant folder
  #
  # get '/api/v1/items/find', to: 'items#find_all'
  namespace :api do

    namespace :v1 do
      resources :merchants do
        get :find, on: :collection
        get :items
      end

      resources :items do
        # get :find, to: 'items#find_all'
        get :find_all, on: :collection
        get :find, on: :collection
        get :merchant
      end


    end
  end
end
