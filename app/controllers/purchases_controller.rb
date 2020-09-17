class PurchasesController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :move_to_index2, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
  end

  def create
    @purchase = PurchaseAddress.new(order_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end
  
  def move_to_index2
    # params[:item_id]はurlのitems/item_id/purchaseを取得している
    # ここではItemテーブルに合致する情報を取得している
    @item = Item.find(params[:item_id])
    unless @item.purchase.nil?
      # アソシエーション↑で結びつける
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end