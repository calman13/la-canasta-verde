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
end
