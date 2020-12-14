require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe 'item_orderの保存' do
    context 'item_orderが保存できる場合' do
      it 'token、郵便番号、都道府県、市区町村、番地、建物名、電話番号があれば保存できる' do
        expect(@item_order).to be_valid
      end

      it '建物名が空でも保存できる' do
        @item_order.building = nil
        @item_order.valid?
        expect(@item_order).to be_valid
      end

    end

    context 'addressが保存できない場合' do
      it 'tokenがないと保存できない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号がないと保存できない' do
        @item_order.zip_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Zip code can't be blank")
      end

      it '郵便番号はハイフン(-)がないと保存できない' do
        @item_order.zip_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end

      it '都道府県がないと保存できない' do
        @item_order.shipplace_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Shipplace can't be blank")
      end

      it '市区町村がないと保存できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地がないと保存できない' do
        @item_order.blocknum = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Blocknum can't be blank")
      end

      it '電話番号がないと保存できない' do
        @item_order.tel = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Tel can't be blank")
      end

      it '電話番号はハイフン(-)無しでないと保存できない' do
        @item_order.tel = '03-203-4324'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Tel is invalid')
      end

      it '電話番号は12桁以上では保存されない' do
        @item_order.tel = '123456789012'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Tel is invalid')
      end

    end
  end
end
