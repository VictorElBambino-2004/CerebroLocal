class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.integer :score
      t.string :player_name

      t.timestamps
    end
  end
end
