class PurchasesController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :move_to_index2, only: [:index]
  
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

  def move_to_index2
    # params[:item_id]はurlのitems/item_id/purchaseを取得している
    # ここではItemテーブルに合致する情報を取得している
    @purchase = Item.find(params[:item_id])
    if @purchase.purchase != nil
      # アソシエーション↑で結びつける
      redirect_to root_path
    end
  end
end
