class SightingsController < ApplicationController
  def index
    @sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: @sightings
  end

  def show
    @sighting = Sighting.find_by(id: params[:id])

    if @sighting 
      render json: @sighting
    else 
      render json: { error: 'Sighting not found' }, status: :not_found
    end
  end

  def update
    @sighting = Sighting.find_by(id: params[:id])
    
    if @sighting
      if @sighting.update(sighting_params)
        render json: @sighting
      else
        render json: @sighting.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Sighting not found' }, status: :not_found
    end
  end

  def destroy
    @sighting = Sighting.find_by(id: params[:id])
    
    if @sighting
      if @sighting.destroy
        render json: @sighting, status: :ok
      else
        render json: @sighting.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Sighting not found' }, status: :not_found
    end
  end

  private

  def sighting_params
    params.require(:sighting).permit(:date, :latitude, :longitude)
  end
end
