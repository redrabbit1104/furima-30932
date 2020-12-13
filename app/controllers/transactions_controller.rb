class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
    redirect_to root_path if current_user.id == @item.user_id  #自身が出品した商品ページに直接接続しようとするとトップページに移動する
   
    @orders = Order.all       #soldoutした商品に直接url入力して購入手続きしようとするとトップページに遷移する
    @orders.each do |order|
      if @item.id == order.item_id
        redirect_to root_path
      end
    end

  end

  def create
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

   #:order_idはaddressテーブルとorderテーブルが紐づけられているので、わざわざパラメータとして送る必要はない。
  def order_params
    params.require(:item_order).permit(:zip_code, :shipplace_id, :city, :blocknum, :building, :tel, :number, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) 
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


# params.require(:item_order).permit(:zip_code, :shipplace_id, :city, :blocknum, :building, :tel, :number, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])