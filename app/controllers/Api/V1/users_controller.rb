class Api::V1::UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create
        parsed_json = JSON.parse(request.body.read)
        @user = User.create(parsed_json)
        @user.save
        render json: @user, status: status
    end


end
