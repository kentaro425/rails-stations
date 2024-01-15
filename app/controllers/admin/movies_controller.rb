class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page]).per(15)
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
    render '/movies/show'
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to admin_movies_path, notice: "Movie was successfully created."
    else
      flash.now[:alert] = @movie.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admin_movies_path
    else
      flash.now[:alert] = @movie.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to admin_movies_path, notice: "映画を削除しました"
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end
end
