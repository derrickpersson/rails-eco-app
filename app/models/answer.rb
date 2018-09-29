class Answer < ApplicationRecord
    # Todo: Use the right validation to ensure records are created correctly.
    # belongs_to :quiz_questions
    # belongs_to :users
    def self.getAllUserAnswers(user)
        @answers = Answer.where("user_id = #{@user.id}")
    end

    def self.getUserAnswer(user, question)
        @answer = Answer.where("user_id = #{user.id} AND quiz_question_id = #{question["id"]}")
    end

end