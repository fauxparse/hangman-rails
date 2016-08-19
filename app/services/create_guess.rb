class CreateGuess
  include Cry

  def initialize(game, letter)
    @game = game
    @letter = letter
  end

  def call
    if guess.save
      if correct?
        publish(:correct, guess)
      else
        publish(:incorrect, guess)
      end
    else
      publish(:failure, guess)
    end
  end

  private

  def guess
    @guess ||= @game.guesses.build(letter: @letter)
  end

  def correct?
    game_state.correct_guesses.include?(guess)
  end

  def game_state
    @game_state ||= GameState.new(@game)
  end
end
