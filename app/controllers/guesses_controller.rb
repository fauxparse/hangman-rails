class GuessesController < ApplicationController
  before_action :load_game

  def create
    CreateGuess.new(@game, guess_params[:letter])
      .on(:correct)   { |guess| flash[:notice] = "Yes! #{guess.letter} is in the word." }
      .on(:incorrect) { |guess| flash[:notice] = "Sorry, #{guess.letter} is not in the word." }
      .on(:failure)   { |guess| flash[:notice] = "You can’t guess #{guess.letter}" }
      .call

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
