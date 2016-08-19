Feature: Submit guesses
  As a Hangman player
  I want to submit one letter guesses and be told whether my guess is either in the word, not in the word, or already guessed
  So that I can make progress in the game

  Scenario: Guess is in the word
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
      And I click "G"
     Then I should be on the game page
      And I should see "G______"
      And I should see "G is in the word"

  Scenario: Guess is not in the word
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
      And I click "X"
     Then I should be on the game page
      And I should see "_______"
      And I should see "X is not in the word"

  Scenario: Guess has already been tried
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
      And I click "G"
     Then I should be on the game page
      And I should see "G______"
      And the "G" button should be disabled
