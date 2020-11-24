require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
 before do
   @order_address = FactoryBot.build(:order_address)
 end

 describe '購入者の住所情報登録' do
  context '購入者の住所情報登録がうまく行く時' do
    it "postal_cord, region_id, municipality, house_number, building_name, phone_number" do
      expect(@order_address).to be_valid
    end

    context '購入者の住所情報登録がうまくいかない時' do
      it 'postal_cordがないと登録できない' do
        @order_address.postal_cord = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cord can't be blank", "Postal cord is invalid")
      end

      it 'region_idがないと登録できない' do
        @order_address.region_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Region can't be blank", "Region is not a number")
      end

      it 'municipalityがないと登録できない' do
        @order_address.municipality = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'house_numberがないと登録できない' do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberがないと登録できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end

      it 'postal_cordにハイフンがないと登録できない' do
        @order_address.postal_cord = 7777777
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal cord is invalid")
      end

      it 'phone_numberにハイフンがあると登録できない' do
        @order_address.phone_number = 111-1111-1111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが11桁でないと登録できない' do
        @order_address.phone_number = 888888888888
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      
      it 'tokenが空では登録できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end


    end
  end
 end
end 
# bundle exec rspec 