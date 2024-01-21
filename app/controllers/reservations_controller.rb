class ReservationsController < ApplicationController
  def show
  end

  def new
    if params[:date].blank? || params[:sheet_id].blank?
      flash[:alert] = "予約情報を入力してください。"
      redirect_to movie_path(params[:movie_id]) and return
    end
    @reservation = Reservation.new
    @movie = Movie.find(params[:movie_id])
    render :new, locals: { movie_id: params[:movie_id], schedule_id: params[:schedule_id], date: params[:date], sheet_id: params[:sheet_id] }
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to movie_path(params[:reservation][:movie_id]), notice: "予約が完了しました"
    else
      message = @reservation.errors[:email].include?("is not a valid email format") ? "メールアドレスの形式が正しくありません" : "その座席はすでに予約済みです"
      redirect_to movie_reservation_path(movie_id: params[:reservation][:movie_id], schedule_id: params[:reservation][:schedule_id], date: params[:reservation][:date]), alert: message
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name)
  end
end
