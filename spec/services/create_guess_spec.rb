require 'rails_helper'

describe CreateGuess do
  let(:service) { CreateGuess.new(game, letter) }
  let(:game) { Game.create(secret: "GNOSTIC") }

  context "when the letter is in the word" do
    let(:letter) { "G" }

    it "creates the guess" do
      expect { service.call }.to change { game.guesses.count }.by 1
    end

    it "publishes the :correct event" do
      expect(service).to receive(:publish).with(:correct, an_instance_of(Guess))
      service.call
    end
  end

  context "when the letter is not in the word" do
    let(:letter) { "X" }

    it "creates the guess" do
      expect { service.call }.to change { game.guesses.count }.by 1
    end

    it "publishes the :correct event" do
      expect(service).to receive(:publish).with(:incorrect, an_instance_of(Guess))
      service.call
    end
  end

  context "when the letter is not valid" do
    let(:letter) { "6" }

    it "does not create the guess" do
      expect { service.call }.not_to change { game.guesses.count }
    end

    it "publishes the :failure event" do
      expect(service).to receive(:publish).with(:failure, an_instance_of(Guess))
      service.call
    end
  end
end
