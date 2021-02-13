class FriendsController < ApplicationController
  def new
  end

  def create
    render plain: params[:friend].inspect
  end
end
