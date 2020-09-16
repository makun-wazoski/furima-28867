require 'rails_helper'
RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入情報の保存' do
    context '商品購入情報の保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば商品購入情報が保存できる' do
        expect(@purchase_address).to be_valid
      end
      it 'postal_codeにハイフンがあればれば商品購入情報が保存できる' do
        @purchase_address.postal_code = '300-9999'
        expect(@purchase_address).to be_valid
      end
      it 'phone_numberが11桁以内且つハイフン不要ならなら登録できる' do
        @purchase_address.phone_number = '09099990'
        expect(@purchase_address).to be_valid
      end
    end
    
    context '商品購入情報の保存がうまくいかないとき' do
      it 'tokenが空だと保存できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank, Postal code Input correctly")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @purchase_address.postal_code = '1112222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank, Postal code Input correctly")
      end
      it 'prefecture_idを選択しないと登録できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'house_numberが空では保存できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberを選択しないと保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上は保存できない' do
        @purchase_address.phone_number = '090999900009'
        @purchase_address.valid?
        # binding.pry
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @purchase_address.phone_number = '090-999-000'
        @purchase_address.valid?
        # binding.pry
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end