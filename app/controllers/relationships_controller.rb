class RelationshipsController < ApplicationController
  def create
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    follow = current_user.active_relationships.find_by!(follower_id: params[:user_id])
    follow.destroy
    respond_to do |format|
      format.js
    end
  end
end
