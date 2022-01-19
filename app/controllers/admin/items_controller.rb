class Admin::ItemsController < ApplicationController
  
  def new
    @genres = Genre.all
    @item = Item.new
  end
  
  def index
    @items = Item.all
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to new_admin_item_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image_id,:name,:introduction,:genre_id,:price,:is_active)
  end
  
end
