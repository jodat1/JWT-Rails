class PigsController < ApplicationController
    def index

        pigs = Pig.all

        render json: {pigs: pigs}

    end

    def create
        pig = Pig.create(
            name: params[:name],
        )

        render json: {pig: pig}
    end
end
