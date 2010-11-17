class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    
    if @friendship.save
      redirect_to root_url, :flash => {:success => "Added friend."}
    else
      redirect_to root_url, :flash => {:error => "Unable to add friend."}
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to current_user, :flash => {:success => "Removed friend."}
  end

end
