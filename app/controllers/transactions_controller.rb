class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:zip_code, :shipplace_id, :city, :blocknum, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end
  
end
