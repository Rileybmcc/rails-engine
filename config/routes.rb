Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #
  #   # namespace merchants? new items controller in merchant folder
  #

  namespace :api do

    namespace :v1 do
      resources :merchants do
        get :find, on: :collection
        get :items
      end

      resources :items do
        get :find_all, on: :collection
        get :merchant
      end


    end
  end
end
# if params[:min_price] || params[:max_price]
#     if params[:name] && params[(:max_price)]
#       render json: {:data => {}}, status: "error", code: 400, error: 'Cannot Search Both Name and By Price'
#
#     elsif  params[:name] && params[(:min_price)]
#       render json: {:data => {}}, status: "error", code: 400, error: 'Cannot Search Both Name and By Price'
#
#     elsif params[:max_price] && params[:min_price]
#       valid_items_with_mm = Item.where("#{params[:min_price]} <= unit_price <= #{params[:max_price]}")
#       render json: {:data => valid_items_with_mm}
#
#     elsif params[:min_price]
#       valid_items_with_min = Item.where("unit_price >= #{params[:min_price]}")
#       render json: {:data => valid_items_with_min}
#
#     elsif params[:max_price]
#       valid_items_with_max = Item.where("unit_price <= #{params[:max_price]}")
#       render json: {:data => valid_items_with_max}
#
#       render json: {:data => {}}, status: "error", code: 400, message: "Search Parameter Must Be Greater Than Zero"
#
# elsif matching_items
#   render json: {:data => matching_items}
#
# else
#   render json: {:data => []}
# end
