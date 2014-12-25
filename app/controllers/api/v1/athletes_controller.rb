class Api::V1::AthletesController < ApplicationController
  respond_to :json

  def index
    respond_with Athlete.active
  end

  def show
    respond_with athlete
  end

  def create
    respond_with :api, :v1, Athlete.create(athlete_params)
  end

  def update
    respond_with athlete.update(athlete_params)
  end

  def destroy
    respond_with athlete.destroy
  end

  private

  def athlete
    Athlete.find(params[:id])
  end

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :status, :gender)
  end

end