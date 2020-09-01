class ItemsController < ApplicationController
before_action :move_to_new_user_session, except:[:index, :show]


  def index
  end

  def show
  end

  def move_to_new_user_session
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end
end
