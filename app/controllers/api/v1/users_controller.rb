class Api::V1::UsersController < ApplicationController
    
    def index 
        @users = User.all
        if @users
          render json: (@users)
        else 
          render json: {status: 500, errors: ["No users found"]}
        end
      end
    
      def create 
        @user = User.new(user_params)
        if @user.save
          login!
          render json: UserSerializer.new(@user)
        else
          render json: {error: 'Error creating user'}
        end
      end
    
      def show
        @user = User.find_by_id(params[:id])
        render json: UserSerializer.new(@user)
      end
    
      def destroy
        @user = User.find_by_id(params[:id])
        @user.destroy
      end
        
      private
    
      def user_params
        params.require(:user).permit(:name, :email, :image, :password, :password_confirmation )
      end
    
end
