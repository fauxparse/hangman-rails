Feature: Play a game of Hangman
  As a Hangman player
  I want to play a game of Hangman
  So I can keep my brain sharp

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
     Then I should see "Congratulations!"
      And I should see "GNOSTIC"
      And I should see "10 lives remaining"

  Scenario: I don’t guess the word before the time runs out
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
      And I click "Q"
      And I click "W"
      And I click "E"
      And I click "R"
      And I click "Y"
      And I click "U"
      And I click "P"
      And I click "A"
      And I click "D"
      And I click "F"
     Then I should see "Game over"
      And I should see "_______"
      And I should see "0 lives remaining"
