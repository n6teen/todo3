Given("I am on the todos page") do
  visit todos_path
end

Given("a todo exists with the title {string}") do |title|
  Todo.create!(title: title, status: false)
end

When("I reload the page") do
  visit current_path
end

When("I fill in the todo input with {string}") do |text|
  find('[data-testid="todo-input"]').fill_in(with: text)
end

When("I click the add todo button") do
  find('[data-testid="add-todo-button"]').click
end

When("I check the todo status checkbox for {string}") do |title|
  todo_item = find('[data-testid="todo-item"]', text: title, match: :first)
  within(todo_item) do
    find('[data-testid="todo-checkbox"]').click
  end
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should not see {string}") do |text|
  expect(page).not_to have_content(text)
end

Then("I should see the quest {string} is checked") do |quest_title|
  quest_item = find('[data-testid="todo-item"]', text: quest_title)
  checkbox = quest_item.find('[data-testid="todo-checkbox"]')
  expect(checkbox).to be_checked
end

When("I click the delete todo button") do
    find('[data-testid="delete-todo-button"]', match: :first).click
end
