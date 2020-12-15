class ItemOrder
  include ActiveModel::Model
  attr_accessor :zip_code, :city, :blocknum, :building, :tel, :shipplace_id, :user_id, :item_id, :token

  # ↑この記述によって各属性の値を取得できる

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :blocknum
    validates :tel, format: { with: /\A^\d[0-9]{0,10}$\z/ } # 電話番号は-なしの0~9の数字1桁から11桁以内でないと入力できないようにする
    validates :token
    validates :user_id
    validates :item_id
  end


  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :shipplace_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, city: city,  blocknum: blocknum, building: building, tel: tel, shipplace_id: shipplace_id, order_id: order.id)
    # ↑attr_accessorで取得した値を指定する。ex):zip_codeには値zip_codeを指定。
    # attr_accessorで定義していないこれから保存処理する新しい属性(order_id)に関しては変数に代入し利用する。order_id: order.id
  end
end
