class Admin::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end


  private
  def customer_params
    params.require(:customer).permit(:name, :user_name, :introduction, :email, :is_deleted)
  end

end
