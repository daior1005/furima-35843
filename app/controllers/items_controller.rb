class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:show, :index]
  def index
    # @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:item_name, :explain, :shipment_day_id, :category_id, :item_status_id, :delivery_charge_id,
                                 :delivery_area_id, :cost, :image).merge(user_id: current_user.id)
  end
end
