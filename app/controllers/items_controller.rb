class ItemsController < ApplicationController
  # before_action :move_to_new_user_session, except:[:index, :show]
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    # @item = Item.new
  end
  # def show
  # end

  # def move_to_new_user_session
  #   
  #   redirect_to new_user_session_path,unless user_signed_in?
  #   end
  # end
end
