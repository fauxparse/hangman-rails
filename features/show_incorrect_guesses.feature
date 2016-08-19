Feature: show incorrect guesses
  As a Hangman player
  I want to see the letters I’ve guessed incorrectly
  So that I don’t guess the same wrong letter again

  Scenario: Guessing a letter correctly
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
      And I click "X"
     Then the "X" button should be disabled
