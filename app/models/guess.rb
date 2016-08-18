class Guess < ApplicationRecord
  belongs_to :game

  validates :letter,
    presence: true,
    inclusion: { in: Game::LETTERS, allow_blank: true },
    uniqueness: { scope: :game_id }

  scope :oldest_first, -> { order(:created_at) }

  def <=>(another)
    created_at <=> another.created_at
  end
end
