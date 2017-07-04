class FriendshipsController < ApplicationController

  def index
    @friends = current_user.friends
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:user_id], :confirmed => false)
    if @friendship.save
      @invitation_sent = true
    else
      @invitation_sent = false
    end
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html { redirect_to @user}
      format.js
    end
  end

  def search_friends
    @friends = current_user.friends.where("lower(name) like ?", "%#{params[:name].downcase}%")
  end

  def confirm_friend
    @friendship = current_user.received_friendships.find_by(user_id:  params[:id])
    @friendship.confirmed = true
    if @friendship.save
      @is_friend = true
      redirect_to users_path
    else
      @is_friend = false
      redirect_to root_url
    end
  end

  def cancel_friend
    @friendship = current_user.received_friendships.find_by(user_id: params[:id])
    if @friendship.destroy
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def check_friendship
    friendship = current_user.friendships.find_by(:friend_id => params[:user_id])
    if friendship
      @invitation_sent = true
      @is_friend = @friend.confirmed
    else
      @invitation_sent = false
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

end