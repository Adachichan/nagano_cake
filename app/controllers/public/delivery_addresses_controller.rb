class Public::DeliveryAddressesController < ApplicationController

  def index
    @delivery_registration = DeliveryAddress.new
    @delivery_list = DeliveryAddress.all
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
