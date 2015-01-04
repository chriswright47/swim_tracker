class HeatsController < ApplicationController
  before_action :authenticate

  respond_to :json

  def show
    render :json => { :attachmentPartial => render_to_string('heats/_edit', :layout => false, :locals => { :heat => heat, :event => event, :athletes => athletes }) }
  end

  def update
    # TODO: extract this logic maybe?
    heat.swims.destroy_all

    heat_params[:swims].each do |index, swim_params|
      heat.swims.create(swim_params) if swim_params[:athlete_id].present?
    end

    redirect_to meet_path(heat.meet)
  end

  private

  def heat
    @heat ||= Heat.find(params[:id])
  end

  def heat_params
    params.require(:heat).permit!
  end

  def event
    @event ||= heat.event
  end

  def athletes
    @athletes ||= event.eligible_athletes
  end
end