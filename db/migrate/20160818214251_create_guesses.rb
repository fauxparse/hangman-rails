class CreateGuesses < ActiveRecord::Migration[5.0]
  def change
    create_table :guesses do |t|
      t.belongs_to :game, foreign_key: true
      t.string :letter, limit: 1
      t.timestamps
    end
  end
end
