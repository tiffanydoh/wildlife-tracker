class AnimalsController < ApplicationController
  def index
    animals = Animal.all
    render json: animals
  end

  def show
    animal = Animal.find(params[:id])

    if animal.valid?
      render json: animal
    else
      render json: animal.errors, status: :not_found
    end
  end

  def update
    animal = Animal.find(params[:id])
    animal.update(animal_params)

    if animal.valid?
      render json: animal
    else 
      render json: animal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    animal = Animal.find(params[:id])

    if animal.destroy
      render json: animal, status: :ok
    else
      render json: animal.errors
    end
  end

  def create
    animal = Animal.new(animal_params)

    if animal.save
      render json: animal, status: :created
    else
      render json: animal.errors, status: :unprocessable_entity
    end
  end

  private 
  def animal_params
    params.require(:animal).permit(
      :common_name,
      :latin_name,
      :kingdom
    )
  end
end
