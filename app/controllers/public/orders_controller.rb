class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @registered_address = current_customer.delivery_addresses
  end

  def confirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    @cart_item_list = current_customer.cart_items
    select_delivery_address_number = params[:order][:select_delivery_address]

    if select_delivery_address_number == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    elsif select_delivery_address_number == "1"
      delivery_address = current_customer.delivery_addresses.find(params[:order][:delivery_address_id].to_i)
      @order.postal_code = delivery_address.postal_code
      @order.address = delivery_address.address
      @order.name = delivery_address.name

    else

    end

    @order.postage = 800
    @total_price = 0

  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    # 注文詳細モデルにカート内商品の情報を保存
    cart_item_list = current_customer.cart_items

    cart_item_list.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.purchase_price = (cart_item.item.price * 1.1).floor
      @order_item.amount = cart_item.amount
      @order_item.save
    end

    # カート内商品の情報をすべて削除
    current_customer.cart_items.destroy_all
    redirect_to complete_order_path

  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:total_price, :postage, :payment_method, :postal_code, :address, :name)
  end


end
