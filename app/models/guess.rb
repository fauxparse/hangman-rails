class Guess < ApplicationRecord
  belongs_to :game

  scope :oldest_first, -> { order(:created_at) }

  def <=>(another)
    created_at <=> another.created_at
  end
end
