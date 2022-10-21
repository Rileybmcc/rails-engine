Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #
  # get '/api/v1/merchants/:id/items', to: 'api/v1/merchants#items'
  #   # namespace merchants? new items controller in merchant folder
  #
  # get 'api/v1/items/:id/merchant', to: 'api/v1/items#merchant'

  namespace :api do

    namespace :v1 do
      resources :merchants do
        get '/items', to: 'merchants#items'
      end  #, only: %i[index show items]

      resources :items
      # namespace :items do
      #   resources :merchant#, only: %i[show]
      # end

    end
  end

end

# namespace :merchant do
#   resources :items
#
# end
