class Admin::OrderItemsController < ApplicationController

  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order


    byebug
    @order_item.update(product_status: params[:order_item][:product_status])
  end

end
