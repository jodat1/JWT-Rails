class User < ApplicationRecord
    has_secure_password

    #Other validations:
    
    # validates :password, length:{
    #     min: 7,
    #     max: 20,
    # }

    # validates :username, uniqueness: true
end
