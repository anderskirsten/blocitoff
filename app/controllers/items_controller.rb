class ItemsController < ApplicationController
  respond_to :html, :js
  
  def new
    @item = Item.new
  end
  
  def create
    @user = current_user
    
    @item = Item.new(item_params)
    @item.user = @user
    @item.save!
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :user_id)
  end
end
