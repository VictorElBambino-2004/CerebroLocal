class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.text :prompt
      t.json :options
      t.string :correct_answer
      t.string :category

      t.timestamps
    end
  end
end
