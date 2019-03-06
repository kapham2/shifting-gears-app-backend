class Api::V1::GamesController < ApplicationController

    def index
        render json: Game.all
    end

    def create
        @game = Game.new(game_params)
        if @game.save
            render json: @game, status: :created
        else
            render json: { error: 'Failed to create game' }, status: :not_acceptable
        end
    end

    def top_10
        render json: Game.order(distance: :desc).limit(10).order(avg_velocity: :desc)
    end

    private

    def game_params
        params.require(:game).permit(:user_id, :distance, :time, :avg_velocity)
    end
end