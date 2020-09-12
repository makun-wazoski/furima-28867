class ItemsController < ApplicationController
  # before_action :move_to_new_user_session, except:[:index, :show]
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
    # @user = User.find(params[:nickname])
  end

  def done
    @item_purchase = Item.find(params[:id])
    @item_purchase.update(purchase_id: current_user.id)
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :text, :cotegory_id, :status_id, :shipping_burden_id, :shipping_erea_id, :date_shipment_id, :price).merge(user_id: current_user.id)
  end
end
