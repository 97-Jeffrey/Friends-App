class FriendsController < ApplicationController

  def index
    @friends = Friend.all
  end
  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end
  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    if @friend.update(friend_params)
      redirect_to @friend, {notice: "This person's info is updated"}
    else
      render "edit" 
    end
  end

  def create
    @friend  = Friend.new(friend_params)

    if @friend.save
      redirect_to @friend, {notice: "#{@friend.first_name} was successfully added"}
    else 
      render "new"
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect_to friends_path, {notice: "Successfully removed a friend"}
  end

  private 
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone_number,:twitter)
    end
end
