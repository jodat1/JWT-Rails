class PigsController < ApplicationController
    before_action :authenticate, only: [:create]
    
    def index

        pigs = Pig.all

        render json: {pigs: pigs}

    end

    def create
        
        pig = Pig.create(
            name: params[:name],
            user: @user
        )
        render json: {pig: pig}
    end
end
