class FollowshipsController < ApplicationController

  def create
    # @followship = current_user.followships.build(following_id: params[:following_id])
    user = User.find(params[:following_id])
    current_user.follow(user)
    # if @followship.save
      flash[:notice] = "Successfully followed"
      redirect_back(fallback_location: root_path)
    # else
      # flash[:alert] = @followship.errors.full_messages.to_sentence
      # redirect_back(fallback_location: root_path)
    # end
  end

  def destroy
    # @followship = current_user.followships.where(following_id: params[:id])
    # @followship.destroy_all
    user = User.find(params[:id])
    current_user.unfollow(user)
    flash[:alert] = "Followship destroyed"
    redirect_back(fallback_location: root_path)
  end


end
