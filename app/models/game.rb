class Game < ApplicationRecord
  LIVES_PER_GAME = 10

  has_many :guesses, dependent: :destroy

  scope :with_guesses, -> { includes(:guesses) }
end
