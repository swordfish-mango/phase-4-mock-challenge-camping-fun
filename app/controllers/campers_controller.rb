class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_error

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = find_camper
        render json: camper, serializer: CamperActivitySerializer
    end

    def create
        camper = Camper.create(params.permit(:name,:age))
        if camper.valid?
            render json: camper, status: :created
        else
            render json: {errors: camper.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    def find_camper
        Camper.find(params[:id])
    end

    def record_error
        render json: {"error": "Camper not found"}, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end
end
