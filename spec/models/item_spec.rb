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

      it 'カテゴリーが選択されないがないと保存できない' do
        @item.category_id = '--'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it '商品の状態を選ばないと保存できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end

      it '発送料の負担を選ばないと保存できない' do
        @item.shippingfee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shippingfee is not a number')
      end

      it '発送元の地域を選ばないと保存できない' do
        @item.shipplace_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipplace is not a number')
      end

      it '発送までの日数を選ばないと保存できない' do
        @item.dateship_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Dateship is not a number')
      end

      it '販売価格を入力しないと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
