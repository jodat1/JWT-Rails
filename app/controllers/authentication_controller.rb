class AuthenticationController < ApplicationController
    def login
        user = User.find_by(username: params[:username])

        if(!user)
            render json: {error: "Invalid Username"},
            status: :unauthorized

        else
            if user.authenticate(params[:password])
                # rails automatically generates the following secret key
                secret_key = Rails.application.secrets.secret_key_base[0]
                # after "bundle add jwt", we get JWT class which we are using to encode token:
                token = JWT.encode({
                    user_id: user.id,
                    username: user.username}, secret_key)
                render json: {token: token}
                # this token will have three parts: header,body,signature

            else 
                render json: {message: "Wrong password!"}, status: :unauthorized
            end
        end

    end
end
