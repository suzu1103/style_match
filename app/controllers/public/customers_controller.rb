class Public::CustomersController < ApplicationController

  # def my_page
  #   @customer = current_customer
  # end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path
    else
      render :edit
    end
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会しました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end


  def customer_params
    params.require(:customer).permit(:name, :user_namet_name, :introduction, :profile_image)
  end
end
