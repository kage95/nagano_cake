class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.page(params[:page])
  end
  
  def show
    @genres = Genre.all
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end
end
