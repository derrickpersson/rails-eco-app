class Api::V1::QuizzesController < ApplicationController
    def index
        render json: Quiz.all
    end

    def show
        @quiz = Quiz.find params[:id]
        @quiz_questions = QuizQuestion.where("quiz_id = #{@quiz.id}")
        hash = Hash.new
        hash[:quiz] = @quiz.as_json
        hash[:quiz][:questions] = @quiz_questions
        render json: hash
    end
end
