class Public::HomesController < ApplicationController

  def top
    @genre_list = Genre.all
    all_item = Item.all
    @item_list = all_item.where(is_sold: false).order(updated_at: :desc).first(4)

  end

  def about
  end
end
