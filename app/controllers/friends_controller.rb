class FriendsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only:[:edit, :update, :destroy]

  def index
    @friends = Friend.all
  end
  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
    # @friend = current_user.friends.build
  end
  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])
    # @friend = current_user.friends.build(friend_params)
    if @friend.update(friend_params)
      redirect_to @friend, {notice: "This person's info is updated"}
    else
      render "edit" 
    end
  end

  def create
    @friend  = Friend.new(friend_params)

    if @friend.save
      redirect_to @friend, {notice: "'#{@friend.first_name}' was successfully added"}
    else 
      render "new"
    end
  end

  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy
    redirect_to friends_path, {notice: "Successfully removed a friend"}
  end

  def correct_user
    @friend = current_user.friends.find_by(id: params[:id])
    redirect_to friends_path, notice: "Not authorized to edit this friend" if @friend.nil?
  end

  private 
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone_number,:twitter, :user_id)
    end
end
