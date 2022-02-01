class Public::SearchesController < ApplicationController
  
  def search
    @genres = Genre.all
    content = params[:content]
    @items = Item.where('introduction LIKE ?',"%#{content}%")
  end
  
  def genre_search
    @genres = Genre.all
    genre_id = params[:genre_id]
    @items = Item.where(genre_id: genre_id)
  end
  
  private
  
  def search_params
    params.require(:search).permit(:content,:genre_id)
  end
  
end
