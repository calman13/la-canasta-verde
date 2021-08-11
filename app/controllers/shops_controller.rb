class ShopsController < ApplicationController


  

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def shop_params
    params.require(:shop).permit(:name, :history, :image)
  end
  
 

end

