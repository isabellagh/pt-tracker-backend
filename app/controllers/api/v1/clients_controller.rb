class Api::V1::ClientsController < ApplicationController

    def index 
        # if logged_in?
        #   @clients = current_user.clients
        @clients = Client.all
          render json: @clients, status: :ok
        # else
        #   render json: {
        #     error: "Not logged in", status: :unauthorized
        #   }
        # end 
      end
    
      def create 
        @client = Client.new(client_params)
        if @client.save
          render json: @client, status: :created, location: @client
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end
    
      def show
        render json: @client
        # @client = Client.find_by_id(params[:id])
      end
    
      def destroy
        # @client = Client.find_by_id(params[:id])
        @client.destroy
      end
        
      private
    
      def client_params
        params.require(:client).permit(:name, :age, :gender, :email, :goal, :image, :weight, :height, :waist, :hip, :user_id)
      end
end
