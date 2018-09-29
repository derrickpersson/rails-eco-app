class QuizQuestion < ApplicationRecord
    belongs_to :quiz
    has_many :answers, dependent: :destroy

    def self.getQuestionsWithAnswers(user, quiz)
        @questions = QuizQuestion.where("quiz_id = #{quiz.id}")
        question_hash = Hash.new
        question_hash[:questions] = @questions.as_json
        question_hash[:questions].each {
            | question |
                question[:answer] = Answer.getUserAnswer(user, question)
        }
        question_hash
    end
end
