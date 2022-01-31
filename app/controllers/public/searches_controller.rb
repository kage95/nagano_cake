class Public::SearchesController < ApplicationController
  
  def search
    content = params[:content]
    @items = Item.where('introduction LIKE ?',"%#{content}%")
  end
  
  def genre_search
    genre_id = params[:genre_id]
    @items = Item.where(genre_id: genre_id)
  end
  
  private
  
  def search_params
    params.require(:search).permit(:content,:genre_id)
  end
  
end
