class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
    render json: @animals
  end

  def show
    @animal = Animal.includes(:sightings).find_by(id: params[:id])
    
    if @animal
      render json: {
        animal: @animal,
        sightings: @animal.sightings
      }
    else
      render json: { error: 'Animal not found' }, status: :not_found
    end
  end

  def update
    @animal = Animal.find_by(id: params[:id])
    
    if @animal
      if @animal.update(animal_params)
        render json: @animal
      else
        render json: @animal.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Animal not found' }, status: :not_found
    end
  end

  def destroy
    @animal = Animal.find_by(id: params[:id])
    
    if @animal
      if @animal.destroy
        render json: @animal, status: :ok
      else
        render json: @animal.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Animal not found' }, status: :not_found
    end
  end

  def create
    @animal = Animal.new(animal_params)
    
    if @animal.save
      render json: @animal, status: :created
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  private

  def animal_params
    params.require(:animal).permit(
      :common_name,
      :latin_name,
      :kingdom,
      sightings_attributes: [:id, :date, :latitude, :longitude]
    )
  end
end
