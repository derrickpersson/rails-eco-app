class Quiz < ApplicationRecord
    has_many :quiz_questions, dependent: :destroy

    def self.findAnswersByUser(user, quiz_id)
        @quiz = Quiz.find quiz_id
        @quiz_questions = QuizQuestion.where("quiz_id = #{@quiz.id}")
        hash = Hash.new
        hash[:quiz] = @quiz.as_json
        hash[:quiz][:questions] = QuizQuestion.getQuestionsWithAnswers(user, @quiz)
    end
end
