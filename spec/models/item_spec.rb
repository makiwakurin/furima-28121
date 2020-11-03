require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    # @item.iamgeはFakerで生成するとエラーになる為、直接データーを生成してあげた
    @item.image = fixture_file_upload('public/image/item-sample.png')
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it '商品のname,text,image,category, status, charge, region, days_to_ship,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    # 商品情報入力に関するテスト

    context '商品出品がうまくいかないとき' do
      it '商品のnameが存在しなければ登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品のtextが存在しなければ登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it '商品のimageが存在しなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品のcategoryが存在しなければ登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end

      it '商品のstatusが存在しなければ登録できない' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end

      it '商品のchargeが存在しなければ登録できない' do
        @item.charge = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank", 'Charge is not a number')
      end

      it '商品のregionが存在しなければ登録できない' do
        @item.region = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank", 'Region is not a number')
      end

      it '商品のdays_to_shipが存在しなければ登録できない' do
        @item.days_to_ship = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank", 'Days to ship is not a number')
      end

      it '商品のpriceが存在しなければ登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      # 商品の価格の入力制限に関するテスト

      it '商品のpriceは半角数字のみでなければ登録できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字で入力して下さい', 'Price is not a number')
      end

      it '商品価格の範囲が、¥300以上でなければ登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end

      it '商品価格の範囲が、¥9,999,999以下でなければ登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
    end
  end
end
# bundle exec rspec spec/models/item_spec.rb
