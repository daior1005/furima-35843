class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :user_back, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def user_back
    return redirect_to root_path if @item.user != current_user
  end

  def set_user
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:item_name, :explain, :shipment_day_id, :category_id, :item_status_id, :delivery_charge_id,
                                 :delivery_area_id, :cost, :image).merge(user_id: current_user.id)
  end
end
