class Public::DeliveryAddressesController < ApplicationController

  def index
    @delivery_registration = DeliveryAddress.new
    @delivery_destinations = DeliveryAddress.all
  end

  def create
    @delivery_registration = DeliveryAddress.new(delivery_registration_params)
    @delivery_registration.customer_id = current_customer.id
    @delivery_registration.save
    redirect_to delivery_addresses_path
  end

  def destroy
    @delivery_registration = DeliveryAddress.find(params[:id])
    @delivery_registration.destroy
    redirect_to delivery_addresses_path
  end

  def edit
  end

  def update
  end

  # 配送先登録のストロングパラメータ
  private

  def delivery_registration_params
    params.require(:delivery_address).permit(:postal_code, :address, :name)
  end

end
