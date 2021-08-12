class ShopsController < ApplicationController

  def index
    if params[:query].present?
      @query = params[:query]
      @shops = Shop.where("name LIKE ?","%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @shops = Shop.all
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @user = current_user
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
      redirect_to shops_path(@shop)
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
