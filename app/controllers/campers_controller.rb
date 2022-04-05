class CampersController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def index
    campers = Camper.all 
    render json: campers
  end

  def show
    camper = Camper.find_by(id: params[:id])
    if camper 
      render json: camper, serializer: CamperWithActivitiesSerializer
    else
      render json: { error: "Camper not found"}, status: :not_found
    end
  end

  def create
    camper = Camper.create!(camper_params)
      render json: camper, status: :created
  end

  private
  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity 
  end
    
  def camper_params
    params.permit(:name, :age)
  end
end
