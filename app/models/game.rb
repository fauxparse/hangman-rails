class Game < ApplicationRecord
  LIVES_PER_GAME = 10
  LETTERS = "A".."Z"

  has_many :guesses, dependent: :destroy

  before_validation :sanitize_secret, if: :secret?

  validates :secret,
    presence: true,
    format: { with: /\A[A-Z]+\z/, allow_blank: true }

  scope :with_guesses, -> { includes(:guesses) }

  private

  def sanitize_secret
    self.secret = secret.strip.upcase
  end
end
