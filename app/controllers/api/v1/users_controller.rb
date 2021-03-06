class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :top_10_games]
    
    def index
        render json: User.all
    end

    def show
        render json: current_user, status: :accepted
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, token:@token }, status: :created
        else
            render json: { error: 'Failed to create user' }, status: :not_acceptable
        end
    end

    def top_10_games
        render json: current_user.games.order(avg_velocity: :desc).limit(10)
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
