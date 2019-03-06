class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

    def signin
        @user = User.find_by(username: signin_params[:username])
        if @user && @user.authenticate(signin_params[:password])
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, token: @token }, status: :accepted
        else
            render json: { error: 'Invalid username or password' }, status: :unauthorized
        end
    end

    private

    def signin_params
        params.require(:user).permit(:username, :password)
    end
end
