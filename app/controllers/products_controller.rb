class ProductsController < ApplicationController
    before_action :set_shop, only: [:new, :create]
    def index
     @products = Product.all
    end
    
    def show
     @product = Product.find(params[:id])
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        @product.shop = @shop
        if @product.save
            redirect_to root_path
        else
            render :new
        end
    end
    
    private

    def set_shop
    @shop = Shop.find(params[:shop_id])
    end

    def product_params
        params.require(:product).permit(:title, :description, :price, :amount)
    end

end
