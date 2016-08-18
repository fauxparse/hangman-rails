Given(/^I start a new game$/) do
  visit(root_url)
  click_link("New game")
end

Given(/^the secret word is "([^"]*)"$/) do |word|
  game.update(secret: word)
end

Given(/^the secret word has (\d+) letters?$/) do |count|
  game.update(secret: "X" * count.to_i)
end

Given(/^I am on the home page$/) do
  visit(root_url)
end

When(/^I am playing the game$/) do
  visit(game_url(game))
end

When(/^I click "([^"])"$/) do |letter|
  click_button(letter)
end

When(/^I click the "([^"]*)" link$/) do |arg1|
  click_link("New game")
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content(content)
end

Then(/^I should be on the game page$/) do
  expect(page.current_path).to eq(game_path(game))
end

Then(/^I should see (\d+) blank spaces?$/) do |count|
  expect(page).to have_content("_" * count.to_i)
end
