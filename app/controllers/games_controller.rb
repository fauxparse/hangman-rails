class GamesController < ApplicationController
  def index
  end

  def show
  end

  def create
    game = Game.create
    redirect_to game
  end
end
