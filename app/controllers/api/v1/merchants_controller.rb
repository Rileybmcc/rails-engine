module Api
  module V1
    class MerchantsController < ApplicationController

      def index
        all_merchants = Merchant.all
        render json: {:data => all_merchants}#, status: :ok
      end

      def find
        merchant = Merchant.where("name ILIKE ?", "%#{params[:name]}%").first
        if params[:name] == "" || params[(:id && :name)] == nil
          render status: 400
        elsif merchant
          render json: {:data => merchant}
        else
          render json: {:data => {}}
        end
      end

      def show
        merchant = Merchant.find(params[:id])
        render json: {:data => merchant}
      end

      def items
        merchant = Merchant.find(params[:merchant_id])
        merchant_items = merchant.items
        render json: {:data => merchant_items}
      end

    end
  end
end
