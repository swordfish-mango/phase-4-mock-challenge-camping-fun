class SignupsController < ApplicationController
    def create
        signup = Signup.create(valid_params)
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render json: {errors: signup.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def valid_params
        params.permit(:time,:activity_id,:camper_id)
    end
end
