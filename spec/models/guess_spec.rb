require 'rails_helper'

RSpec.describe Guess, type: :model do
  subject(:guess) { game.guesses.new(letter: letter) }
  let(:game) { Game.create(secret: "GNOSTIC") }

  context "when the letter is missing" do
    let(:letter) { nil }
    it { is_expected.not_to be_valid }
    it { is_expected.to have_exactly(1).error_on(:letter) }
  end

  context "when the letter is invalid" do
    let(:letter) { "6" }
    it { is_expected.not_to be_valid }
    it { is_expected.to have_exactly(1).error_on(:letter) }
  end

  context "when the letter has already been guessed" do
    let(:letter) { "G" }

    it { is_expected.to be_valid }

    context "but has already been guessed" do
      before { game.guesses.create(letter: letter) }
      it { is_expected.not_to be_valid }
      it { is_expected.to have_exactly(1).error_on(:letter) }
    end
  end
end
