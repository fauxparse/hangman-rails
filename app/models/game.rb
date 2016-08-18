class Game < ApplicationRecord
  LIVES_PER_GAME = 10

  has_many :guesses, dependent: :destroy

  scope :with_guesses, -> { includes(:guesses) }

  def state
    State.new(self)
  end

  private

  class State
    def initialize(game)
      @game = game
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

    def guessed_correctly?
      word == game.secret
    end

    def wrong_guesses
      game.guesses.select { |guess| !game.secret.include?(guess.letter) }
    end

    def lives_remaining
      [Game::LIVES_PER_GAME - wrong_guesses.length, 0].max
    end

    def game_over?
      guessed_correctly? || lives_remaining.zero?
    end

    def revealed_word
      if game_over?
        game.secret
      else
        word
      end
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
end
