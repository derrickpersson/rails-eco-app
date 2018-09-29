class Api::V1::AnswersController < ApplicationController
    def index
        # TODO: show all quizzes with answers from users
        @user = User.find params[:user_id]
    end
    
    def show
        @user = User.find params[:user_id]
        @quizAnswers = Quiz.findAnswersByUser( @user, params[:id])
        render json: @quizAnswers
    end
end
