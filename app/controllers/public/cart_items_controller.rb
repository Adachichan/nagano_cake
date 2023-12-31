class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @cart_item_list = current_customer.cart_items
    @total_price = 0
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_item_list = current_customer.cart_items
    @cart_item_list.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.update(amount: @cart_item.amount)

    else
      @cart_item.save
    end

    redirect_to cart_items_path

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
