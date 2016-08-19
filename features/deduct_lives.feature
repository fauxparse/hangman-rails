Feature: Deduct lives
  As a Hangman player
  There should be 1 life deducted every time I make an incorrect guess of a letter that I have not already guessed
  So that the tension is increased

  Scenario: Guess is not in the word
    Given I start a new game
      And the secret word is "GNOSTIC"
     When I am playing the game
      And I click "X"
     Then I should see "9 lives remaining"
