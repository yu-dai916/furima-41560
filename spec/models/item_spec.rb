require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name,image,price,user,category_id,explanation,quality_id,payment_id,prefecture_id,scheduled_delivery_idが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空では保存できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'categoryが空では保存できないこと' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'explanationが空では保存できないこと' do
        @item.explanation =nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'quality_idが空では保存できないこと' do
        @item.quality = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it 'payment_idが空では保存できないこと' do
        @item.payment = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank")
      end
      it 'prefecture_idが空では保存できないこと' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'scheduled_delivery_idが空では保存できないこと' do
        @item.scheduled_delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it 'priceが10000000以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it "quality_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.quality_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank", 'Quality is not a number')
      end
      it "categoryの値が、id:0,name:'--'の時は保存できないこと" do
        @item.category = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it "payment_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.payment_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank", 'Payment is not a number')
      end
      it "prefecture_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it "scheduled_delivery_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank", "Scheduled delivery is not a number")
        it 'userが紐付いていなければ出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User can't be blank")
          it '価格に半角数字以外が含まれている場合は出品できない' do
            @item.price = "aaa"
            @item.valid?
            expect(@price.errors.full_messages).to include("Price can't be blank")
  
        end
      end
    end
  end
end