class GuessesController < ApplicationController
  before_action :load_game

  def create
    @game.guesses.create(guess_params)
    redirect_to @game
  end

  private

  def load_game
    @game = Game.find(params[:game_id])
  end

  def guess_params
    params.require(:guess).permit(:letter)
  end
end
