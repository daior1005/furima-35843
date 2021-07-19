def index
  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new

end

def create
  binding.pry

  @item = Item.find(params[:item_id])
  @order_address = OrderAddress.new(orders_params)
  if @order_address.valid?
    @order_address.save
    redirect_to root_path 
  else
    render :index
  end
end

private

def orders_params
  params.require(:order_address).permit(:post_code, :prefecture_id, :city, :home_num, :building_name, :tel).merge(user_id: current_user.id)

end
end