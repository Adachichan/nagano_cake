class Admin::OrderItemsController < ApplicationController

  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(product_status: params[:order_item][:product_status])

    order_item_in_production_count = @order.order_items.where(product_status: 'in_production').count
    order_item_production_complete_count = @order.order_items.where(product_status: 'production_complete').count
    order_item_record_count = @order.order_items.count

    if order_item_in_production_count > 0
      @order.update(order_status: Order.order_statuses.key(2))
    end

    if order_item_production_complete_count == order_item_record_count
      @order.update(order_status: Order.order_statuses.key(3))
    end

    redirect_to admin_order_path(@order.id)

  end

end