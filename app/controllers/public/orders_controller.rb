class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @registered_address = current_customer.delivery_addresses
  end

  def confirm
  end

  def complete
  end

  def create
    
    
    
    
  end

  def index
  end

  def show
  end
  
  private
  
  

end
