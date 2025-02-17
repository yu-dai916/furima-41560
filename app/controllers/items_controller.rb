class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit, :update, :destroy]
  before_action :set_item, only: [:edit,:show, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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
end

def edit
end
def update
  if @item.update(item_params)
  redirect_to item_path
  else
  render :edit, status: :unprocessable_entity
  end
end

def destroy
  if @item.destroy
    redirect_to root_path
  else
    render :show
  end
end
  private
  def item_params
    params.require(:item).permit(:name, :price, :category_id, :explanation, :quality_id, :payment_id, :prefecture_id, :scheduled_delivery_id, :image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end