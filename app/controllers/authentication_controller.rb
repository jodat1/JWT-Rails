class AuthenticationController < ApplicationController
    def login
        user = User.find_by(username: params[:username])

        if(!user)
            render json: {error: "Invalid Username"},
            status: :unauthorized

        else
            if user.authenticate(params[:password])
                render json: {message: "You have logged in Successfully!"}
            else 
                render json: {message: "Wrong password!"}, status: :unauthorized
            end
        end

    end
end
