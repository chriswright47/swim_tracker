class Api::V1::HeatsController < ApplicationController
  respond_to :json

  def index
    respond_with Heat.all
  end

  def show
    respond_with heat
  end

  def create
    respond_with :api, :v1, Heat.create(heat_params)
  end

  def update
    respond_with heat.update(heat_params)
  end

  def destroy
    respond_with heat.destroy
  end

  private

  def heat
    Heat.find(params[:id])
  end

  def heat_params
    params.require(:heat).permit(:gender, :entry_limit)
  end
end