class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to public_customer_show_path
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.is_deleted = true
    @customer.update(is_deleted: true)
    redirect_to root_path
  end

  def confirm
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end


end
