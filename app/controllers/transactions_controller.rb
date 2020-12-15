class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_item, only: [:index, :create]

  def index  
    @item_order = ItemOrder.new
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end


  def create
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

  #:order_idはaddressテーブルとorderテーブルが紐づけられているので、わざわざパラメータとして送る必要はない。
  def order_params
    params.require(:item_order).permit(:zip_code, :shipplace_id, :city, :blocknum, :building, :tel, :number, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end