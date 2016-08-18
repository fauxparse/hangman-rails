Given(/^I start a new game$/) do
  visit(root_url)
  click_link("New game")
end

Given(/^the secret word is "([^"]*)"$/) do |word|
  game.update(secret: word)
end

When(/^I am playing the game$/) do
  visit(game_url(game))
end

When(/^I click "([^"])"$/) do |letter|
  click_button(letter)
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content(content)
end
