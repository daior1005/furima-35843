require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'image,item_name,explain,category_id,item_status_id,delivery_charge_id,delivery_area_id,shipment_day_id,' do
        expect(@item).to be_valid
      end
      it 'costが300円なら出品できる' do
        @item.cost = 300
        expect(@item).to be_valid
      end
      it 'costが9,999,999円なら出品できる' do
        @item.cost = 9_999_999
        expect(@item).to be_valid
      end
      it 'costが半角なら出品できる' do
        @item.cost = 300
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageがないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameがないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explainがないと出品できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'category_idがないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'item_status_idがないと出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it 'delivery_charge_idがないと出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'delivery_area_idがないと出品できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'shipment_day_idがないと出品できない' do
        @item.shipment_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment day can't be blank")
      end
      it 'costがないと出品できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'costが300円以下だと出品できない' do
        @item.cost = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is not included in the list')
      end
      it 'costが9,999,999円以上だと出品できない' do
        @item.cost = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is not included in the list')
      end
      it 'costが半角数字でないと出品できない' do
        @item.cost = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is not included in the list')
      end
      it 'costが半角英数混合では登録できないこと' do
        @item.cost = '300dollars'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is not a number')
      end
      it 'costが半角英語だけでは登録できないこと' do
        @item.cost = 'threemillion'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is not included in the list')
      end
    end
  end
end
