Feature: Guess the word successfully
  As a Hangman player
  I want the game to end when I have guessed the full word
  So I am rewarded for my skill

  Scenario: I guess the word before the time runs out
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
      And I click "G"
      And I click "N"
      And I click "O"
      And I click "S"
      And I click "T"
      And I click "I"
      And I click "C"
     Then I should see "GNOSTIC"
      And I should see "Congratulations!"
      And I should see "10 lives remaining"
