require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/comment.png')

  end

  describe '商品情報保存' do
    context '商品を保存できるとき' do
      it 'name、explanation、category_id、condition_id、shipping_charge_id、shipping_area_id、shipping_day_id、price、imageが存在すれば登録できる' do
        expect(@item).to be_valid
    end
  end
    context '商品を保存できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")

      end
      it 'explantationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_charge_idが1では登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'shipping_area_idが1では登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'shipping_day_idが1では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '全角文字を含むpriceでは登録できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be half-width number')
      end
 
      it 'priceが300以下では登録できない' do
        @item.price = '250'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between 300 and 9_999_999')
      end

      it 'priceが9_999_999より大きい場合登録できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be between 300 and 9_999_999')
      end
    end
   end
  end


      
      
      
      
      
