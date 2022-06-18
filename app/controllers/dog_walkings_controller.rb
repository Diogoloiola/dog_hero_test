class DogWalkingsController < ApplicationController
  before_action :set_dog_walking, only: %i[show update destroy start_walk end_walk]

  def index
    @dog_walkings = DogWalking.all
  end

  def show; end

  def create
    @dog_walking = DogWalking.new(dog_walking_params)

    if @dog_walking.save
      render :show, status: :created
    else
      render json: @dog_walking.errors, status: :unprocessable_entity
    end
  end

  def update
    if @dog_walking.update(dog_walking_params)
      render :show, status: :ok
    else
      render json: @dog_walking.errors, status: :unprocessable_entity
    end
  end

  def start_walk
    update
  end

  def end_walk
    update
  end

  def destroy
    @dog_walking.destroy
  end

  private

  def set_dog_walking
    @dog_walking = DogWalking.find(params[:id])
  end

  def dog_walking_params
    params.require(:dog_walking).permit(:appointment_date, :price, :duration, :latitude, :longitude, :start_tour,
                                        :end_tour, dogs_attributes: %i[name])
  end
end
