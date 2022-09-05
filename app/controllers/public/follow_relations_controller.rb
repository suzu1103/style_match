class Public::FollowRelationsController < ApplicationController
  def follow
   current_customer.follow(params[:id])
   redirect_to customer_path
  end

  def unfollow
   current_customer.unfollow(params[:id])
   redirect_to customer_path
  end

  def followed
    customer = Customer.find(params[:customer_id])
    @customers = customer.followed
  end

  def follower
    customer = Customer.find(params[:customer_id])
    @customers = customer.follower
  end
end
