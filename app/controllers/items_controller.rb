class ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
    @user = current_user
    
    @item = Item.new(item_params, user_id: @user.id)
    @item.user = @user
      if @item.save!
        flash[:notice] = "'#{@item.name}' has been added to your todo list."
        redirect_to authenticated_root_path
      else
        flash[:alert] = "There was a problem saving this item to your todo list. Please try again."
        redirect_to authenticated_root_path
      end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :user_id)
  end
end
