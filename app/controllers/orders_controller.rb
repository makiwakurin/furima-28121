class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    @item = Item.new(order_params)
    if @item.save
      redirect_to :index
    end
  end

  private

  def order_params
    params.require(:item).permit(item_id: item.id, user_id: user.id)
  end
end
# , :postal_coad, :region_id, :municipality, :house_number, :building_name, :phone_number