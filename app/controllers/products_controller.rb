class ProductsController < ApplicationController
    before_action :set_shop, only: [:new, :create]
    def index
        if params[:query].present?
          @products = Product.where("lower(title)  LIKE ?", "%" + params[:query].downcase + "%")
        else
          @products = Product.all
        end
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
        params.require(:product).permit(:title, :description, :price, :amount, :image)
    end
<<<<<<< HEAD
=======

>>>>>>> 568aaaee5d9f16a5a5b94290499705df8b63297a
    #def destroy
      #@product = Product.find(params[:id])
     # @product.destroy
     # redirect_to products_path
    #end
end
