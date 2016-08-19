Feature: reveal correct guesses
  As a Hangman player
  I want to see the letters I’ve guessed correctly revealed on the hidden word that I am trying to guess
  So that I can guess the word more readily

  Scenario: Guessing a letter correctly
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
     Then I should see "_______"
     When I click "G"
     Then I should see "G______"
