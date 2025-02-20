require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end
    context '商品購入がうまくいくとき' do
      it "必要な情報がすべて揃っていれば保存ができる" do
        expect(@order_address).to be_valid
      end
      it 'postal_codeがハイフン含めた7桁の数字なら登録できる' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it 'phone_numberが11桁の数字なら登録できる' do
        @order_address.phone_number = '12345678901'
        expect(@order_address).to be_valid
      end
      it 'buliding_nameが空でも保存できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
      it 'user_idが空では保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'house_numberが空では保存できないこと' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'postal_codeが空では保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空では保存できないこと' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it "prefecture_idの値が、id:1,name:'--'の時は保存できないこと" do
        @order_address.prefecture_id = [1]
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'postal_codeが6桁以下だと登録できないこと' do
        @order_address.postal_code = '123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code must be in the format XXX-XXXX')
      end
      it 'postal_codeが8桁以上だと登録できないこと' do
        @order_address.postal_code = '12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code must be in the format XXX-XXXX')
      end
      it 'postal_codeがハイフンがないと登録できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code must be in the format XXX-XXXX')
      end
      it 'phone_numberが9桁以下だとの数字なら登録できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number must be 10 or 11 digits")
      end
      it 'phone_numberが12桁以上だとの数字なら登録できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number must be 10 or 11 digits')
      end
    end
  end