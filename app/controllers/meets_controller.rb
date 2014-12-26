class MeetsController < ApplicationController
  respond_to :json

  def index
    respond_with Meet.all
  end

  def show
    respond_with meet
  end

  def create
    new_meet = Meet.create(meet_params)

    Event.all.each do |event|
      ['male', 'female'].each do |gender|
        new_meet.heats.create(
          :event => event,
          :entry_limit => params[:entry_limit] || 3,
          :gender => gender
        )
      end
    end

    respond_with :api, :v1, new_meet
  end

  def update
    respond_with meet.update(meet_params)
  end

  def destroy
    respond_with meet.destroy
  end

  private

  def meet
    Meet.find(params[:id])
  end

  def meet_params
    params.require(:meet).permit(:opponent, :competition_date)
  end
end