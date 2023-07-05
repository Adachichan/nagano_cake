class Admin::ItemsController < ApplicationController

  def index
    @item_list = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genre_list = Genre.all
  end

  def create
    @item = Item.new(item_registration_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def item_registration_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_sold)
  end

end
