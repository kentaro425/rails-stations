class Admin::SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
    @schedule.movie_id = params[:movie_id]
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to admin_movie_path(@schedule.movie), notice: "schedule was successfully created."
    else
      flash.now[:alert] = @schedule.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to admin_movie_path(@schedule.movie), notice: "schedule was successfully updated."
    else
      flash.now[:alert] = @schedule.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to admin_movie_path(@schedule.movie), notice: "schedule was successfully destroyed."
  end

  private

  def schedule_params
    params.require(:schedule).permit(:movie_id, :start_time, :end_time)
  end
end
