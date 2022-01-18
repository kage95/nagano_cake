class Admin::GenresController < ApplicationController
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    genres = Genre.all
    genre = Genre.new(genre_params)
    genre.save
    redirect_to admin_genres_path(genres)
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    genres = Genre.all
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path(genres)
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
end
