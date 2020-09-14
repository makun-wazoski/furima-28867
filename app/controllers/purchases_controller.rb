class PurchasesController < ApplicationController
  before_action :move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
