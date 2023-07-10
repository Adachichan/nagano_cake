class Public::ItemsController < ApplicationController

  def index
    @genre_list = Genre.all

    if params[:genre_id]
      @genre = @genre_list.find(params[:genre_id])
      all_item = @genre.items

    else
      all_item = Item.all

    end

    @item_list = all_item.where(is_sold: false).page(params[:page]).per(8)
    @item_count = all_item.where(is_sold: false).count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genre_list = Genre.all
  end

end
