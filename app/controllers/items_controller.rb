class ItemsController < ApplicationController

  def index
  end

  def new
    @furima = Furima.new
  end

  def create
    Furima.create(furima_params)
  end

  private
  def furima_params
    params.require(:item).permit(:item_name, :exlain, :shipment_day_id, :category_id, :item_status_id, :delivery_charge_id, :delivery_area_id, :cost, :image).merge(user_id: current_user.id)
  end

 
end
