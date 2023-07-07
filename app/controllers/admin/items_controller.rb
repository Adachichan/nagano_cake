class Admin::ItemsController < ApplicationController

  def index
    @item_list = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genre_list = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre_list = Genre.all
    @genre = @item.genre.name
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :genre_id, :price, :is_sold)
  end

end
