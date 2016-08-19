Feature: Show lives remaining
  As a Hangman player
  I would like to see how many lives are remaining
  So that the tension is increased

  Scenario: Guess is in the word
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
      And I click "G"
     Then I should see "10 lives remaining"
