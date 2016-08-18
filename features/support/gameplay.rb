module Gameplay
  def game
    @game ||= Game.last
  end
end

World(Gameplay)
