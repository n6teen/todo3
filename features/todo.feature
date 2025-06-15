Feature: Todo Management
    As a user
    I want to interact with the todo list
    So I can keep track of what needs doing

    Background:
        Given I am on the todos page

    Scenario: Seeing the empty state when no todos exist
        Then I should see "No quests yet"

    Scenario: Adding a todo item
        When I fill in the todo input with "Do laundry"
        And I click the add todo button
        Then I should see "Do laundry"
        And I should not see "No todos yet"

    Scenario: Marking a todo as complete
        Given a todo exists with the title "Buy milk"
        When I reload the page
        When I check the todo status checkbox for "Buy milk"
        Then I should see the quest "Buy milk" is checked
    Scenario: Deleting a todo
        Given a todo exists with the title "Read a book"
        When I reload the page
        And I click the delete todo button
        Then I should not see "Read a book"