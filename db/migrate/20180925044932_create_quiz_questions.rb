class CreateQuizQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_questions do |t|
      t.belongs_to :quiz, index: true
      t.string :question
      t.timestamps
    end
  end
end
