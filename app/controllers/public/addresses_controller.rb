class Public::AddressesController < ApplicationController
  
  def index
    @addresses = current_customer.addresses
    @address = Address.new
  end
  
  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    address.save!
    redirect_to addresses_path
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code,:address,:name)
  end
  
end
