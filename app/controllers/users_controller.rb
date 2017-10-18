class UsersController < ApplicationController
  def show
    if current_user
      @user = current_user
      @item = Item.new
      @items = Item.where(user_id: @user.id)
    else
      redirect_to root_path
    end
  end
end
