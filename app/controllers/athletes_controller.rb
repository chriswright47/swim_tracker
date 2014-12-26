class AthletesController < ApplicationController
  def index
    @men = Athlete.active_men
    @women = Athlete.active_women
  end

  def show
    athlete
  end

  def new
    @athlete = Athlete.new
  end

  def create
    @athlete = Athlete.new(athlete_params)
    if @athlete.save
      flash[:success] = "#{@athlete.full_name} successfully created"
      redirect_to athletes_path
    else
      flash.now[:danger] = athlete_errors
      render 'new'
    end
  end

  def edit
    athlete
  end

  def update
    if athlete.update(athlete_params)
      flash['success'] = 'Updates were successful!'
      redirect_to athlete_path(athlete)
    else
      flash.now['danger'] = athlete_errors
      render 'edit'
    end
  end

  def destroy
    if athlete.destroy
      flash['success'] = 'Successful deletion!'
      redirect_to athletes_path
    else
      flash.now['danger'] = athlete_errors
      render 'edit'
    end
  end

  private

  def athlete
    @athlete ||= Athlete.find(params[:id])
  end

  def athlete_errors
    @athlete.errors.full_messages.join('. ')
  end

  def athlete_params
    params.require(:athlete).permit(:first_name, :last_name, :status, :gender)
  end
end