class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  # def new
  #   @order_address = OrderAddress.new
  # end

  def create
    @order_address = OrderAddress.new(orders_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      # pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def orders_params
    params.require(:order_address).permit(:post_code, :delivery_area_id, :city, :home_num, :building_name, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end

  # def pay_item
  #   Payjp.api_key = "sk_test_ef625018ada88039426272b1"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  #   Payjp::Charge.create(
  #     amount: order_params[:price],  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end
end
