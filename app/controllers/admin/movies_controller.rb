class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page]).per(15)
  end
end
