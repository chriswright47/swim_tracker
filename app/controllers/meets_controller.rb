class MeetsController < ApplicationController
  before_action :authenticate

  def index
    @meets = Meet.all
  end

  def show
    meet
  end

  def pdf
    pdf = MeetPdfGenerator.new(meet: meet).render!
    send_data pdf, :filename => meet.pdf_filename, :type => 'application/pdf'
  end

  def csv
    csv = MeetCsvGenerator.new(meet: meet, options: {:col_sep => ','}).render!
    send_data csv, :filename => meet.csv_filename, :type => 'application/csv'
  end

  def new
    @meet = Meet.new
  end

  def create
    ## TODO: extract this logic perhaps
    @meet = Meet.create(meet_params)

    # create a heat for every event
    Event.all.each do |event|
      entry_limit = if event.varsity
        (params[:meet][:entry_limit] || 3).to_i
      else
        8
      end

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