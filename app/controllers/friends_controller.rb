class FriendsController < ApplicationController
  def show
    @friend = Friend.find(params[:id])
  end
  
  def new
  end

  def create
    # render plain: params[:friend].inspect
    @friend  = Friend.new(friend_params)
    @friend.save
    redirect_to @friend
  end

  private 
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone_number,:twitter)
    end
end
