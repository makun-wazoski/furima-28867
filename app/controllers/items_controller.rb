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
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
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
