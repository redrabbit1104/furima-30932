class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :info, :price, :tax, :profit, :category_id, :status_id, :shippingfee_id, :shipplace_id, :dateship_id).merge(user_id: current_user.id)
  end
end
