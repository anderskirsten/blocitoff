class ItemsController < ApplicationController
  respond_to :html, :js
  
  def new
    @item = Item.new
  end
  
  def create
    @user = current_user
    
    @item = Item.new(item_params)
    @item.user = @user
    
    if @item.save!
      flash[:notice] = "'#{@item.name}' has been added to your todo list."
      redirect_to authenticated_root_path
    else
      flash[:alert] = "There was a problem saving this item to your todo list. Please try again."
      redirect_to authenticated_root_path
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "'#{@item.name}' has been marked as complete and deleted from your todo list."
      redirect_to authenticated_root_path
    else
      flash[:alert] = "There was a problem marking this item as complete. Please try again."
      redirect_to authenticated_root_path
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :user_id)
  end
end
