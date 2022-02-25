class PurchasesController < ApplicationController

  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new

    if @item.purchase.present? 
        redirect_to root_path
    end

  end


  def create
    
   
    # @purchase_address = Item.find(params[:item_id])
  
    @purchase_address = PurchaseAddress.new(purchase_params)
    # @purchase_address = @purchase 
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      @purchase = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_number, :shipping_area_id, :city, :house_number, :building, :telephone ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    # binding.pry
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  
end
