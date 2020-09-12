require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品登録' do
    context '商品登録がうまくいくとき' do
      it 'image,item,text,cotegory_id,status_id,shipping_burden_id,shipping_erea_id,date_shipment_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '価格の範囲が￥300~￥9,999,999の間であれば登録できる' do
        @item.price = '300-9999999'
        expect(@item).to be_valid
      end
      it '販売価格が半角数字なら登録できる' do
        @item.price = '999999'
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'itemが空では登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'cotegoryを選択しないと登録できない' do
        @item.cotegory_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Cotegory Select')
      end
      it 'statusを選択しないと登録できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'shipping_burdenを選択しないと登録できない' do
        @item.shipping_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping burden Select')
      end
      it 'shipping_ereaが空では登録できない' do
        @item.shipping_erea_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping erea Select')
      end
      it 'date_shipmentが空では登録できない' do
        @item.date_shipment_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Date shipment Select')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと登録できない' do
        @item.price = '４５６７'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Price Out of setting range, Price Half-width number')
      end
      it 'priceが300-9999999の間でなければ登録でない' do
        @item.price = @item.price < 300 && @item.price > 9_999_999
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Price Out of setting range, Price Half-width number')
      end
    end
  end
end
