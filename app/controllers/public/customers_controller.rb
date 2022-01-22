class Public::CustomersController < ApplicationController
  # before_action :configure_permitted_parameters,only:[:new]
  
  
  # private
  
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:first_name_kana,:last_name,:last_name_kana,:email,:postal_code,:address,:telephone_number])
  # end
  
  # def customer_params
  #   params.require(:customer).require(:first_name,:first_name_kana,:last_name,:last_name_kana,:email,:postal_code,:address,:telephone_number)
  # end
end
