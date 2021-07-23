class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_signed_in, except: [:index]
  before_action :set_furima, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

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
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def sold_out_item
    redirect_to root_path if @item.present?
  end

  def set_furima
    @item = Item.find(params[:item_id])
  end

  def prevent_url
    redirect_to root_path if @item.user_id == current_user.id || !@item.order.nil?
  end

  def orders_params
    params.require(:order_address).permit(:post_code, :delivery_area_id, :city, :home_num, :building_name, :tel).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.cost,
      card: orders_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
