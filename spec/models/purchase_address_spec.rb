require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'post_numberが空では登録できない' do
        @purchase_address.post_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number can't be blank")

      end
      it 'post_numberハイフンなしでは登録できない' do
        @purchase_address.post_number = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")

      end
      it 'post_numberは半角文字のみ保存可能' do
        @purchase_address.post_number = '１２３−４５６７'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number must be half-width number" )

      end

      it 'shipping_area_idが1では登録できない' do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank" )

      end

      it 'cityが空では登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank" )

      end
      it 'house_numberが空では登録できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank" )

      end
      it 'telephoneが空では登録できない' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank" )

      end

      it 'telephoneが半角文字のみ保存可能' do
        
        @purchase_address.telephone = '０７０８５９９９９９９'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone must be half-width number" )


      end

      it 'telephoneが10桁又11桁でないと保存できない' do
        
        @purchase_address.telephone = '080111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is too short" )
        

      end

    end
  end
end
