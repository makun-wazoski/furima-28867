class ItemsController < ApplicationController
  # before_action :move_to_new_user_session, except:[:index, :show]
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :text, :cotegory_id, :status_id, :shipping_burden_id, :shipping_erea_id, :date_shipment_id).merge(user_id: current_user.id)
  end

  # , :item, :text, :category, :status, :shipping_burden, :shipping_erea, :date_shipment, :price

  # def show
  # end

  # def move_to_new_user_session
  #   
  #   redirect_to new_user_session_path,unless user_signed_in?
  #   end
  # end
end
