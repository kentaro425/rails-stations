class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    # @reservations = Reservation.where('date >= ?', Date.today).order(:id)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @movies = Movie.all
    render '/admin/reservations/edit'
  end

  def new
    @reservation = Reservation.new
    @movies = Movie.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to admin_reservations_path, notice: "予約が完了しました"
    else
      message = @reservation.errors[:email].include?("is not a valid email format") ? "メールアドレスの形式が正しくありません" : "その座席はすでに予約済みです"
      @reservations = Reservation.where('date >= ?', Date.today).order(:id)
      flash.now[:alert] = message
      head :bad_request
      # render :index
      redirect_to admin_reservations_path, alert: message
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @movies = Movie.all
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to admin_reservations_path, notice: "予約を更新しました"
    else
      message = @reservation.errors[:email].include?("is not a valid email format") ? "メールアドレスの形式が正しくありません" : "その座席はすでに予約済みです"
      redirect_to admin_reservations_path, alert: message
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to admin_reservations_path, notice: "予約を削除しました"
  end

  def get_schedules
    movie = Movie.find(params[:movie_id])
    schedules = movie.schedules
    render json: schedules
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name)
  end
end
