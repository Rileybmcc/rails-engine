module Api
  module V1
    class ItemsController < ApplicationController

      def index
        all_items = Item.all
        render json: {:data => all_items}, status: status = :ok
      end

      def show
        # require "pry"; binding.pry
        this_item = Item.find(params[:id].to_i)
        if this_item
          render json: {:data => this_item}, status: status = :ok
        elsif params[:id].to_s.class != integer
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
# require "pry"; binding.pry
        item = Item.find(params[:id])
        new_item = item.update_attributes(standard_params)
        # require "pry"; binding.pry

        if new_item
          # new_item.save
          render json: {:data => item}, status: status = :ok
        else
          # render json: {:data => item}
          # error
          render status: 400
        end
      end

      def merchant
# require "pry"; binding.pry
        item_merchant = Item.find(params[:id]).merchant
        render json: {:data => item_merchant}, status: status = :ok
      end

      private
      def standard_params
        params.permit(:name, :description, :unit_price, :merchant_id)
      end


    end
  end
end
