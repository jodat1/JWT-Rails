class UsersController < ApplicationController

    def create
        user = User.create(
            name: params[:name],
            email: params[:email],
            username: params[:username],
            password: params[:password],
        )
        render json: user, status: :created         
    end
end
