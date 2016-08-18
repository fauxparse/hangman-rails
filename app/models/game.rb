class Game < ApplicationRecord
  has_many :guesses

  scope :with_guesses, -> { includes(:guesses) }
end
