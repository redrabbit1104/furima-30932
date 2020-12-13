class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:zip_code, :shipplace_id, :city, :blocknum, :building, :tel, :number, :exp_month, :exp_year, :cvc)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])  #:order_idはaddressテーブルとorderテーブルが紐づけられているので、わざわざパラメータとして送る必要はない。
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
