class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.new
    #product = Product.new
    @product = Product.new(shop: @shop)
    #@user = User.new(shop: @shop)
  end

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

  def edit
  end

  def update
    @shop.update(shop_params)
    redirect_to shop_path(@shop)
  end

  def destroy
    @shop.destroy
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :history, :image)
  end
end
