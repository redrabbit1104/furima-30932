require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'itemの保存' do
    context 'itemが保存できない場合' do
      it '画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと保存できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '1以外を選ばないとカテゴリーは保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '1以外を選ばないと商品は保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it '1以外を選ばないと発送料の負担は保存できない' do
        @item.shippingfee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shippingfee must be other than 1')
      end

      it '1以外を選ばないと発送元の地域は保存できない' do
        @item.shipplace_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipplace must be other than 1')
      end

      it '1以外を選ばないと発送までの日数は保存できない' do
        @item.dateship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Dateship must be other than 1')
      end

      it '販売価格を入力しないと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が299円以下では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end

      it '販売価格が10,000,000円以上では保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end
