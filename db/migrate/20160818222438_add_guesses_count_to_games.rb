class AddGuessesCountToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :guesses_count, :integer, default: 0
  end
end
