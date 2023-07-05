class Admin::ItemsController < ApplicationController

  def index
    @item_list = Item.page(params[:page])
  end

  def new
    @item_registration = Item.new
    @genre_list = Genre.all
  end

  def create
    @item_registration = Item.new(item_registration_params)
    @item_registration.save
    redirect_to admin_item_path(@item_registration.id)
  end

  def show
    
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
