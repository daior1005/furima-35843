require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end

      it 'building_nameは空でも保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'delivery_areaを選択していないと保存できないこと' do
      end
      it 'cityが空だと保存できないこと' do
      end
      it 'home_numが空だと保存できないこと' do
      end
      it 'telが空だと保存できないこと' do
      end
      it 'telが半角のハイフンを含まない正しい形式保存できないこと' do
      end
    end
  end
end
