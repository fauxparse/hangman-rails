Feature: Show letter count
  As a hangman player
  I would like to see some indication of how many letters there are in the word that I am supposed to guess
  So that I can make an accurate guess

  Scenario: Eight-letter word
    Given I start a new game
      And the secret word has 8 letters
     When I am playing the game
     Then I should see 8 blank spaces
