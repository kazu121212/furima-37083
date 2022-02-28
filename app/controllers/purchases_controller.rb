class PurchasesController < ApplicationController

  before_action :authenticate_user!
 
  before_action :move_to_index
  

  def index

    @purchase_address = PurchaseAddress.new

    if @item.purchase.present? 
        redirect_to root_path
    end

  end


  def create
  
    @purchase_address = PurchaseAddress.new(purchase_params)
   
    if @purchase_address.valid?
      pay_item
      

      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_number, :shipping_area_id, :city, :house_number, :building, :telephone ).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,  # 商品の値段
          card: purchase_params[:token],    # カードトークン
          currency: 'jpy'                 # 通貨の種類（日本円）
        )
  end

  
end
