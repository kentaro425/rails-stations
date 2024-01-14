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
end
