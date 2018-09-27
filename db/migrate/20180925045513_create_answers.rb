class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :quiz_question, index: true
      t.references :user, index: true
      t.string :answer
      t.timestamps
    end
  end
end
