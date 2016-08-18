require 'rails_helper'

RSpec.describe Game, type: :model do
  subject(:game) { Game.new(secret: secret) }

  context "when the secret is blank" do
    let(:secret) { nil }
    it { is_expected.not_to be_valid }
    it { is_expected.to have_exactly(1).error_on(:secret) }
  end

  context "when the secret is invalid" do
    let(:secret) { "!@#\$%" }
    it { is_expected.not_to be_valid }
    it { is_expected.to have_exactly(1).error_on(:secret) }
  end

  context "when the secret is a word" do
    let(:secret) { "GNOSTIC" }
    it { is_expected.to be_valid }
  end
end
