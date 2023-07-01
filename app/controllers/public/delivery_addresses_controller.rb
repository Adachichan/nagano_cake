class Public::DeliveryAddressesController < ApplicationController

  def index
    @delivery_registration = DeliveryAddress.new
    # @delivery_destination_list = DeliveryAddress.where(customer_id: current_customer.id)
    @delivery_destination_list = current_customer.delivery_addresses
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
    @delivery_registration = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_registration = DeliveryAddress.find(params[:id])
    @delivery_registration.update(delivery_registration_params)
    redirect_to delivery_addresses_path
  end

  # 配送先登録のストロングパラメータ
  private

  def delivery_registration_params
    params.require(:delivery_address).permit(:postal_code, :address, :name)
  end

end
