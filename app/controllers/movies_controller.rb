class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    if params[:is_showing] == '1'
      @movies = @movies.where(is_showing: true)
    elsif params[:is_showing] == '0'
      @movies = @movies.where(is_showing: false)
    end

    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"
      @movies = @movies.where('name LIKE ? OR description LIKE ?', keyword, keyword)
    end
  end
  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
  end

  def reservation
    if params[:schedule_id].blank? || params[:date].blank?
      flash[:alert] = "予約情報を入力してください。"
      redirect_back(fallback_location: movies_path) and return
    end
    @sheets = Sheet.all
    @rows = @sheets.pluck(:row).uniq.sort
    @columns = @sheets.pluck(:column).uniq.sort
    @reservations = Reservation.where(schedule_id: params[:schedule_id], date: params[:date])
    render '/sheets/index', locals: { schedule_id: params[:schedule_id], date: params[:date], movie_id: params[:movie_id] }
  end
end
