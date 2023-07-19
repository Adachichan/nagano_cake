class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_item_list = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_item_list = @order.order_items
    @order.update(order_status: params[:order][:order_status])

    if params[:order][:order_status] == Order.order_statuses.key(1)

      @order_item_list.each do |order_item|
        order_item.update(product_status: OrderItem.product_statuses.key(1))
      end

    end

    redirect_to admin_order_path(@order.id)

  end

end
