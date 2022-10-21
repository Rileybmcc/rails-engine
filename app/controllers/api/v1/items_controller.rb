module Api
  module V1
    class ItemsController < ApplicationController

      def index
        all_items = Item.all
        render json: {:data => all_items}, status: :ok
      end

      def show
        this_item = Item.find(params[:id].to_i)
        if this_item
          render json: {:data => this_item}, status: :ok
        else #params[:id].to_s.class != integer
          error 400, status: 'Not Found'
        end
      end

      def create
        item_new = Item.create!(standard_params)
        render json: {:data => item_new}, status: 201
      end

      def destroy
        current_item = Item.find(params[:id])
        current_item.delete
      end

      def update
        item = Item.find(params[:id])
        new_item = item.update_attributes(standard_params)

        if item.valid?
          render json: {:data => item}, status: :ok
        else
          render status: 400
        end
      end

      def merchant
        item_merchant = Item.find(params[:item_id]).merchant
        render json: {:data => item_merchant}, status: :ok
      end

      def find_all
        if (params[:min_price] != nil || params[:max_price] != nil)
          if params[:min_price].to_i < 0
            render json: {:error => []}, status: 400

          elsif params[:max_price].to_i < 0
            render json: {:error => []}, status: 400

          elsif params[:name] != nil && params[:max_price] != nil
            render status: 400

          elsif params[:name] != nil && params[:min_price] != nil
            render status: 400

          elsif params[:max_price] != nil && params[:min_price] != nil
            valid_items_with_mm = Item.where("#{params[:min_price]} <= unit_price <= #{params[:max_price]}")
            render json: {:data => valid_items_with_mm}

          elsif params[:min_price] != nil
            valid_items_with_min = Item.where("unit_price >= #{params[:min_price]}")
            render json: {:data => valid_items_with_min}

          elsif params[:max_price] != nil
            valid_items_with_max = Item.where("unit_price <= #{params[:max_price]}")
            render json: {:data => valid_items_with_max}

          end

        elsif params[:name] != nil
          matching_items = Item.where("name ILIKE ?", "%#{params[:name]}%")
          render json: {:data => matching_items}

        else
          render json: {:data => []}
        end
      end



      def find
        if params[:min_price].to_i < 0 || params[:max_price].to_i < 0
          render json: {:error => []}, status: 400

        elsif params[:name] != nil && params[:max_price] != nil
          render json: {:data => []}, status: 400

        elsif params[:name] != nil && params[:min_price] != nil
          render status: 400

        elsif params[:max_price] != nil && params[:min_price] != nil
          valid_items_with_mm = Item.where("#{params[:min_price]} <= unit_price <= #{params[:max_price]}")
          render json: {:data => valid_items_with_mm}


        elsif params[:min_price] != nil
          valid_items_with_min = Item.where("unit_price >= #{params[:min_price]}")
          render json: {:data => valid_items_with_min}

        elsif params[:max_price] != nil
          valid_items_with_max = Item.where("unit_price <= #{params[:max_price]}")
          render json: {:data => valid_items_with_max}
        end

      end

      private
      def standard_params
        params.permit(:name, :description, :unit_price, :merchant_id)
      end

    end
  end
end
