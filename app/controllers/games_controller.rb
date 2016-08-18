class GamesController < ApplicationController
  before_action :load_game, only: :show

  def index
  end

  def show
    @board = GameState.new(@game)
  end

  def create
    game = Game.create(secret: "SECRET")
    redirect_to game
  end

  private

  def load_game
    @game = Game.with_guesses.find(params[:id])
  end
end
