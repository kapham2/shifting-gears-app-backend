class Api::V1::UsersController < ApplicationController
    
    def index
        render json: User.all
    end

    def show
        @user = User.find(params[:id])

        render json: @user, status: :accepted
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password_digest)
    end
end
