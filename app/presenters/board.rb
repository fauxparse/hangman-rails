class Board
  def initialize(game)
    @state = game.state
  end

  def letters
    "A".."Z"
  end

  def status
    if guessed_correctly?
      :won
    elsif game_over?
      :lost
    else
      :in_progress
    end
  end

  delegate :game_id, :word, :revealed_word, :game_over?, :lives_remaining, :guessed?, :guessed_correctly?,
    to: :state

  private

  attr_reader :state
end
