class ApplicationController < ActionController::API
    def  authenticate
        authorization_header = request.headers[:authorization]  #header -> bearer token
        if !authorization_header
            render json: unauthorized
        else

            token = authorization_header.split(' ')[1] #this will split bearer and token with spaces and get the token whiich is on 2nd index
            secret_key = Rails.application.secrets.secret_key_base[0]
            decoded_token =  JWT.decode(token, secret_key)
            @user = User.find(decoded_token[0]["user_id"])
        end
    end
end
