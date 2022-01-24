class Admin::CustomersController < ApplicationController
  
  def index
    @customers = Customer.page(params[:page]).per(10)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:first_name,:first_name_kana,:last_name,:last_name_kana,:email,:postal_code,:address,:telephone_number)
  end
end
