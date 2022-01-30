class Public::SearchesController < ApplicationController
  
  def search
    content = params[:content]
    @items = Item.where('introduction LIKE ?',"%#{content}%")
  end
  
  private
  
  def search_params
    params.require(:search).permit(:content)
  end
  
end
