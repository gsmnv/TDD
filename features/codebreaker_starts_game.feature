Feature: code-breaker starts game

  As a code-breaker
  I want to start game
  So that i can break the code

  Scenario:
    Given I am not yet playing
    When I start a new game
    Then I should see "Welcome to Codebreaker! [Enter 'g' to give up]"
    And I should see "Enter guess:"
