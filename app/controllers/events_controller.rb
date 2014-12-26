class EventsController < ApplicationController
  respond_to :json

  def index
    respond_with Event.all
  end

  def show
    respond_with event
  end

  private

  def event
    Event.find(params[:id])
  end
end