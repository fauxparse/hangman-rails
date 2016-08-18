Feature: Start a new game
  As a hangman player
  I would like to be able to start a new game of hangman
  So that I can play multiple games

  Scenario: New game
    Given I am on the home page
     When I click the "New game" link
     Then I should be on the game page
      And I should see "10 lives remaining"
