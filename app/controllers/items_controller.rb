class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit, :update]
  before_action :contributor_confirmation, only: [:edit, :update]
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

def show
  @item = Item.find(params[:id])
end

def edit
  @item = Item.find(params[:id])
end
def update
  @item = Item.find(params[:id])
  if @item.update(item_params)
  redirect_to item_path
  else
  render :edit, status: :unprocessable_entity
  end
end
  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id, :explanation, :quality_id, :payment_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item
  end
end