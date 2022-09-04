class Public::FollowRelationsController < ApplicationController
  def follow
   current_customer.follow(params[:id])
   redirect_to root_path
  end
  def unfollow
   current_customer.unfollow(params[:id])
   redirect_to root_path
  end  
end
