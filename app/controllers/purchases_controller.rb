class PurchasesController < ApplicationController
  before_action :move_to_index, only: [:index]
  before_action :move_to_index2, only: [:index]
  
  def index
    @item = Item.find(params[:item_id])
    # @purchase = PurchaseAddress.new
  end
  
  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(order_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
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

  private  
  
  def order_params
    # Parameter { "item" => { "name" => "ガンダム", "category_id" => "5",    } }
    # params.require(:item).premit(:name, :category_id,    ).merge(user_id: current_user.id)
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number,:token).merge(user_id: current_user.id, item_id:params[:item_id])
  end

  def pay_item  
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
