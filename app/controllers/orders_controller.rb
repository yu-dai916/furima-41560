class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation

  def index
   
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge( user_id: current_user.id,token: params[:token], item_id: params[:item_id])
  end
  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user.id || @item.order.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )

    
  end
end
