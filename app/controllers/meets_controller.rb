class MeetsController < ApplicationController
  def index
    @meets = Meet.all
  end

  def show
    meet
  end

  def new
    @meet = Meet.new
  end

  def create
    @meet = Meet.create(meet_params)

    # create a heat for every event
    Event.all.each do |event|
      entry_limit = (params[:meet][:entry_limit] || 3).to_i
      @meet.heats.create(
        :event => event,
        :entry_limit => event.relay ? entry_limit * 4 : entry_limit
      )
    end

    redirect_to meet_path(@meet)
  end

  def destroy
    fail 'pending'
  end

  private

  def meet
    @meet ||= Meet.find(params[:id])
  end

  def meet_params
    params.require(:meet).permit(:opponent, :competition_date)
  end

end