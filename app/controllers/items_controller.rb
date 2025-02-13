class ItemsController < ApplicationController
  def index
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

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :explanation, :quality_id, :payment_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end
end