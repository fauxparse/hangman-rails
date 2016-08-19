Feature: Run out of lives
  As a Hangman player
  I want the game to end when I have run out of lives
  So that the tension is increased

  Scenario: I don’t guess the word before my lives run out
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
      And I click "Q"
      And I click "W"
      And I click "E"
      And I click "R"
      And I click "T"
      And I click "Y"
      And I click "U"
      And I click "I"
      And I click "O"
      And I click "P"
      And I click "A"
      And I click "D"
      And I click "F"
     Then I should see "__O_TI_"
      And I should see "Game over"
      And I should see "The word was GNOSTIC"
