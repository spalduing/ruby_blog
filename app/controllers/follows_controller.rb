# frozen_string_literal: true

class FollowsController < ApplicationController
  def follow
    @user = User.find(params[:id])
    current_user.followings << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followings.find_by(followed: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end
end
