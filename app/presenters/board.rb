class Board
  def initialize(game)
    @game = game
  end

  def letters
    "A".."Z"
  end

  def game_id
    game.id
  end

  def word
    game.secret.gsub(/./) { |letter| masked(letter) }
  end

  def guessed?(letter)
    guesses.any? { |guess| guess.letter == letter }
  end

  private

  attr_reader :game

  delegate :guesses, to: :game

  def masked(letter)
    if guessed?(letter)
      letter
    else
      "_"
    end
  end
end
