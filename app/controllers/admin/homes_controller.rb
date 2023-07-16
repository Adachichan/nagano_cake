class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!

  def top
    @customer_list = Customer.all

    if params[:customer_id]
      @customer = @customer_list.find(params[:customer_id])
      all_order = @customer.orders

    else
      all_order = Order.all

    end

    @order_list = all_order.page(params[:page])
  end

end
